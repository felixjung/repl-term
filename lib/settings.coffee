module.exports =
  terminalEmulator:
    description: 'Choose the terminal emulator to run your REPL in.'
    type: 'string'
    enum: ['Terminal.app', 'iTerm.app']
    default: 'Terminal.app'
