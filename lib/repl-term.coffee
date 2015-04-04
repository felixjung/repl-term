{CompositeDisposable} = require 'atom'
terminalHandler = require './terminal-handler'
settings        = require './settings'

module.exports =
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
      'repl-term:launch-repl': -> terminalHandler.launchRepl()
      'repl-term:send-file': -> terminalHandler.sendFile()

  deactivate: ->
    # Here we should close the terminal window
    @subscriptions.dispose()
