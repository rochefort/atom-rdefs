{$, View} = require 'atom-space-pen-views'

module.exports =
  class AtomRdefsView extends View
    @content = (params) ->
      @div class: 'atom-rdefs', =>
        @div class: "#{params.type} message", params.message

    initialize: ->
      @panel ?= atom.workspace.addBottomPanel(item: this)
      setTimeout =>
        @destroy()
      , 3000

    cancelled: ->
      @hide()

    destroy: ->
      @panel.destroy()
