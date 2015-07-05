{CompositeDisposable} = require 'atom'

module.exports =

  activate: (state) ->
    # Load terminal-handler module
    terminalHandler  = require './terminal-handler'
    # Here we should launch a terminal window
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'repl-term:launch-repl': -> terminalHandler.launchRepl (termId) ->
        terminalHandler.TermId = termId
      'repl-term:close-repl': -> terminalHandler.quitRepl()
      'repl-term:send-file': -> terminalHandler.sendFile()
      'repl-term:send': -> terminalHandler.send()

  deactivate: ->
    # Here we should close the terminal window
    @subscriptions.dispose()
