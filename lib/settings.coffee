settings =
  config:
    preferredTerminal:
      title: 'Terminal Emulator'
      description: 'The package supports Terminal.app
                    and iTerm.app.'
      type: 'string'
      default: 'Terminal.app'
      enum: ['Terminal.app', 'iTerm.app']
      order: 1

module.exports = settings
