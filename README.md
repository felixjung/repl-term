# REPL Term

A Mac OS X exclusive package for Atom that allows to send code from the current editor to a REPL running in Terminal.app

## Installation

APM: ``apm install repl-term``
Preferences: Open Atom and go to Preferences > Packages, search for repl-term, and install it

## Usage

| Shortcut          | Action                        |
| ----------------- | ----------------------------- |
| ``cmd + alt + L`` | Launch REPL                   |
| ``cmd + alt + K`` | Kill REPL                     |
| ``cmd + alt + R`` | Send entire file              |
| ``cmd + alt + S`` | Send current line / selection |

## Notes

Currently supported languages and corresponding REPLs are Julia, R, and Python. Trying to launch a REPL for any other file type will simply open a new terminal window.

## Planned features
- Support for iTerm.app
- Option to activate Terminal after sending code
- Strip empty lines from code before sending
- Allow for communication with the REPL (i.e. object browser)
- Support several REPL sessions for various Atom windows
