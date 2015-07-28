_ = require("lodash")

module.exports =
  ReplDict: {
    "julia": "julia",
    "r": "R",
    "python": "python",
    "javascript": "node"
  }

  currentLanguage: ->
    # Obtain filename extension
    language  = atom.workspace.getActiveTextEditor().getGrammar().name
      .toLowerCase()

    console.info "Language is: " + language

    if language not in _.keys(@ReplDict)
      console.warn "Unknown language, returning empty string."
      return ""

    return @ReplDict[language]

  sourcingCommand: (filePath) ->
    # Obtain the right sourcing command for the language
    lang = @currentLanguage()
    cmd  = {}
    switch lang
      when "julia" then cmd = "include(\"" + filePath + "\")"
      when "R" then cmd = "source(\"" + filePath + "\")"
      when "python" then cmd = "execfile('" + filePath + "')"
      else cmd = ""

    return cmd

  workingDirectoryCommand: (path) ->
    # Obtain the right working directory command for the language
    lang = @currentLanguage()
    cmd  = {}
    switch lang
      when "julia" then cmd = "cd(\"" + path + "\")"
      when "R" then cmd = "setwd(\"" + path + "\")"
      when "python" then cmd = "import os; os.chdir(path)"
      else cmd = ""

    return cmd
