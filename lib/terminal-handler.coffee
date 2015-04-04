module.exports =
  WinId: {},
  TabId: {},
  # Starts a new terminal window and launches the REPL
  launchRepl: ->
    osascript = require 'node-osascript'
    console.log(process.cwd())
    osascript.executeFile __dirname + '/applescript/launchTerminal.applescript',
      { language : 'julia' }, (err, res, raw) ->
        if err
          console.error(err)
        else
          @WinId = res['win']
          @TabId = res['tab']

          console.info('Opened new terminal window with window ID #{winID} and
                        tab ID #{tabID}.')
