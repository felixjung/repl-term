{CompositeDisposable} = require 'atom'
terminalHandler = require './terminal-handler'

module.exports =
  # FIXME: the default terminal is not written.
  config:
    preferredTerminal:
      title: 'Terminal Emulator'
      description: 'The package supports Terminal.app
                    and iTerm.app.'
      type: 'string'
      default: 'Terminal.app'
      enum: ['Terminal.app', 'iTerm.app']

  activate: (state) ->
    # Here we should launch a terminal window
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'repl-term:launch-repl': -> terminalHandler.launchRepl (termId) =>
        @TermId = termId
      'repl-term:close-repl': -> terminalHandler.quitRepl()
      'repl-term:send-file': -> terminalHandler.sendFile()
      'repl-term:send': -> terminalHandler.send()

  deactivate: ->
    # Here we should close the terminal window
    @subscriptions.dispose()
