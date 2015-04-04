-- Sends a Code to a Terminal session with a specific window and tab id.
on sendCode(code, winId)
  tell application "Terminal"
    do script code in window id winID
  end tell
end sendCode

-- Call the function
sendCode(code, winId)
