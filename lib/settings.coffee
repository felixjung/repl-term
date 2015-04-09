module.exports =
  terminalEmulator:
    description: 'Choose the terminal emulator to run your REPL in.'
    type: 'string'
    enum: ['Terminal.app', 'iTerm.app']
    default: 'Terminal.app'
  focusTerminal:
    description: 'Should the terminal be put into focus after sending code?'
    type: 'boolean'
    default: false
