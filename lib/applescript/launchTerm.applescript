-- Initializes a new terminal window with either Julia or R
on initTermSession(terminalEmu, initCommand)
  if terminalEmu equals "Terminal.app" then
    tell application "Terminal"
      set termTab to do script initCommand
      set termTabTty to tty of termTab
      set termWindows to every window

      repeat with win in termWindows
        set currentWinId to (id of win as string)
        set currentTabs to every tab of win
        repeat with t from 0 to count of currentTabs
          if (tty of (tab t of win) as string) equals termTabTty
            return (id of win)
          end if
        end repeat
      end repeat
    end tell
  else if terminalEmu equals "iTerm.app" then
    tell application "Finder"
      display dialog "iTerm is not yet supported. Please choose Terminal.app instead."
    end tell
  end if
end initTermSession

-- Call the initialization function
initTermSession(term, language)
