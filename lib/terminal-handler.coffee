String::addSlashes = ->
  @replace(/[\\"']/g, "\\$&").replace /\u0000/g, "\\0"

module.exports =
  WinId: {}
  TabId: {}
  Osascript: {}

  # Starts a new terminal window and launches the REPL
  launchRepl: ->
    @Osascript = require 'node-osascript'
    scriptPath = __dirname + '/applescript/launchTerminal.applescript'
    # TODO: Make this file type agnostic
    @Osascript.executeFile scriptPath,
      { language : 'julia' }, (err, res, raw) =>
        if err
          console.error(err)
        else
          @WinId = res['win']
          @TabId = res['tab']

          console.info "Opened new terminal window with window ID " +
                        @WinId + " and tab ID " + @TabId + "."

  # Loads the file currently being edited in the REPL
  sendFile: ->
    # Save file before doing anything
    atom.workspace.getActiveEditor().save()
    console.info "Saved file before sending to REPL."
    # Obtain the file path
    filePath = atom.workspace.getActiveEditor().getPath()
    console.info "About to send file " + filePath + " to window " + @WinId
    console.info "Type of @WinId in line 31: " + typeof(@WinId)

    # Build command for sourcing files in language
    # TODO: make this filetype agnostic
    command = "include(\"" + filePath + "\")"
    console.info "File loading command: " + command

    # Check if a REPL is running and launch if necessary.
    if !@WinId?
      @launchRepl()

    scriptPath = __dirname + "/applescript/sendCode.applescript"
    @Osascript.executeFile scriptPath,
      { code : command.addSlashes(), winId : @WinId }, (err, res, raw) ->
        if err
          console.error err
        else
          console.info "Sent file " + filePath + " to REPL."
