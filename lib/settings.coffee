settings =
  config:
    preferredTerminal:
      title: 'Use either Terminal or iTerm'
      description: 'The package supports either Terminal
                    or iTerm to run the REPL.'
      type: 'string'
      enum: ['Terminal', 'iTerm']
      order: 1

module.exports = settings
