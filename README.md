# DEPRECATION WARNING
This package is deprecated. I no longer need this kind of feature and making the communication between Atom and Terminal.app work through Applescript was a pain.

Please, feel free to take over.

# REPL Term
A Mac OS X exclusive package for Atom that allows to send code from the current editor to a REPL running in Terminal.app

## Installation
APM: `apm install repl-term` Preferences: Open Atom and go to Preferences > Packages, search for repl-term, and install it

## Usage

Shortcut          | Action
----------------- | -----------------------------
``cmd + alt + L`` | Launch REPL
``cmd + alt + K`` | Kill REPL
``cmd + alt + R`` | Send entire file
``cmd + alt + S`` | Send current line / selection

## Notes
Currently supported languages and corresponding REPLs are Julia, R, Python, and Node.js. Trying to launch a REPL for any other file type will simply open a new terminal window.

This package was inspired by the package [r-exec](https://github.com/hafen/atom-r-exec). I've also taken some tiny bits of code from there.

## Planned features
- Support for iTerm.app
- Option to activate Terminal after sending code
- Strip empty lines from code before sending
- Allow for communication with the REPL (i.e. object browser)
- Support several REPL sessions for various Atom windows
