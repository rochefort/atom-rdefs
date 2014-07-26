{BufferedProcess} = require 'atom'
StatusView = require './atom-rdefs-view'

Os = require 'os'
Path = require 'path'
fs = require 'fs-plus'
resultFilePath = Path.join Os.tmpDir(), 'atom-rdefs-result'

module.exports =
  activate: (state)->
    atom.workspaceView.command "atom-rdefs:show", => @show()

  show: ->
    editor = atom.workspace.activePaneItem
    uri = editor.getUri()
    result = ''
    new BufferedProcess
      command: 'rdefs'
      args: [uri]
      stdout: (data) -> result += data
      stderr: (data) ->
        showStatusView(data)
        console.log('atom-rdefs: ' + msg)
      exit: (code) -> prepFile result if code is 0

prepFile = (text) ->
  if text?.length > 0
    fs.writeFileSync resultFilePath, text, flag: 'w+'
    showFile()
  else
    showStatusView('Nothing to show.')

showFile = ->
  atom.workspace
    .open(resultFilePath, split: 'right', activatePane: true)

showStatusView = (msg) ->
  new StatusView(type: 'error', message: msg)
