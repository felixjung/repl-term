{CompositeDisposable} = require 'atom'
terminalHandler = require './terminal-handler'
# settings = require './settings'

module.exports =
  # config: settings
  config:
    enableThing:
      type: 'boolean'
      default: false
    thingVolume:
      type: 'integer'
      default: 5
      minimum: 1
      maximum: 11

  activate: (state) ->
    # Here we should launch a terminal window
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'repl-term:launch-repl': -> terminalHandler.launchRepl()

  deactivate: ->
    # Here we should close the terminal window
    @subscriptions.dispose()
