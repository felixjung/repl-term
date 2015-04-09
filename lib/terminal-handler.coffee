languageHandler = require './language-handler'

String::addSlashes = ->
  @replace(/[\\""]/g, "\\$&").replace /\u0000/g, "\\0"

module.exports =
  Terminal: "Terminal.app"
  TermId: {}
  Osascript: require "node-osascript"

  sendToRepl: (code, termId) ->
    scriptPath = __dirname + "/applescript/sendCode.applescript"
    @Osascript.executeFile scriptPath,
      { term : @Terminal, code : code.addSlashes(), termId : termId },
      (err, res, raw) ->
        if err
          console.error err
        else
          console.info "Sent code to REPL."

  # Starts a new terminal window and launches the REPL
  launchRepl: (callback) ->
    scriptPath = __dirname + "/applescript/launchTerm.applescript"
    lang       = languageHandler.currentLanguage()

    if lang == ""
      console.warn "Unknown file name extension. Launching terminal without a
                    REPL."

    # TODO: Set the working directory
    @Osascript.executeFile scriptPath,
      { term: @Terminal, language : lang },
      (err, termId, raw) ->
        if err
          console.error err
        else
          setTimeout callback, 1000, termId

  # Closes the terminal window, if still open
  quitRepl: ->
    if typeof @TermId == "object"
      console.info "No Terminal launched, yet. Can't close anything"
    else
      scriptPath = __dirname + "/applescript/closeTerm.applescript"
      @Osascript.executeFile scriptPath,
      { term : @Terminal, termId : @TermId }, (err, res, raw) ->
        if err
          console.error err
          console.error "You probably los the terminal window."
        else
          console.info "Closed the terminal window"

  # Ensures a repl is running before executing callback
  getRepl: (callback) ->
    if typeof @TermId == "object"
      console.info "No Terminal launched, yet. Launching..."
      @launchRepl (termId) =>
        @TermId = termId
        callback termId
    else
      scriptPath = __dirname + "/applescript/checkTerm.applescript"
      @Osascript.executeFile scriptPath,
      { term : @Terminal, termId : @TermId }, (err, termExists, raw) =>
        if err
          console.error err
        else
          if termExists == true
            # Call the callback with @TermId, if a terminal exists
            callback @TermId
          else
            # Or launch a new Terminal with callback as argument
            @launchRepl (termId) =>
              @TermId = termId
              callback termId

  # Loads the file currently being edited in the REPL
  sendFile: ->
    @getRepl (termId) =>
      console.log "Terminal: " + @Terminal
      # Save file before doing anything
      atom.workspace.getActiveEditor().save()
      # Obtain the file path
      filePath = atom.workspace.getActiveEditor().getPath()

      # Build command for sourcing files in language
      command = languageHandler.sourcingCommand filePath

      @sendToRepl command, termId

  # Sends a command to the REPL
  send: ->
    # TODO:
    # - Clean up this code
    # - Remove empty lines
    @getRepl (termId) =>
      code = atom.workspace.getActiveEditor().getSelection()
      if code.getText().addSlashes() == ""
        atom.workspace.getActiveEditor().selectLine()
        code = atom.workspace.getActiveEditor().getSelection()
      @sendToRepl code.getText(), termId
