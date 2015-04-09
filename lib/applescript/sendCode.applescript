-- Sends a Code to a Terminal session with a specific window and tab id.
on sendCode(termEmu, code, termId, focus)
  tell application "Terminal"
    if focus then
      set visible of window id termId to true
    end if
    do script code in window id termId
  end tell
end sendCode

-- Call the function
sendCode(term, code, termId, focus)
