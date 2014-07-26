{Subscriber} = require 'emissary'
{$, View} = require 'atom'

module.exports =
  class AtomRdefsView extends View
    Subscriber.includeInto(this)

    @content = (params) ->
      @div class: 'atom-rdefs overlay from-top', =>
        @div class: "#{params.type} message", params.message

    initialize: ->
      @subscribe $(window), 'core:cancel', => @detach()
      atom.workspaceView.append(this)
      setTimeout =>
        @detach()
      , 5000

    detach: ->
      super
      @unsubscribe()
