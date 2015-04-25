{$} = require 'atom-space-pen-views'
# AtomRdefs = require '../lib/atom-rdefs'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "AtomRdefs", ->
  workspaceElement = null
  editor = null

  beforeEach ->
    workspaceElement = $(atom.views.getView(atom.workspace))
    waitsForPromise ->
      atom.packages.activatePackage('atom-rdefs').fail (reason) ->
        throw reason

  describe "when the atom-rdefs:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(workspaceElement.find('.atom-rdefs')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      # $(workspaceElement).trigger 'atom-rdefs:show'
      atom.commands.dispatch('atom-rdefs:toggle')
      # console.log atom.packages.loadedPackages['atom-rdefs']

      # expect(atom.packages.isPackageActive('atom-rdefs')).toBe true

      # waitsForPromise ->
      #   atom.packages.activatePackage('atom-rdefs')

      # runs ->
      #   expect(workspaceElement.find('.atom-rdefs')).toExist()
        # workspaceElement.trigger 'atom-rdefs:show'
        # atom.commands.dispatch 'atom-rdefs:toggle'
        # expect(workspaceElement.find('.atom-rdefs')).not.toExist()
