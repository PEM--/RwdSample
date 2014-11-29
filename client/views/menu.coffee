@rxMenu = new ReactiveDict

Template.menu.rendered = ->
  rxMenu.set 'isOpen', true
  Tracker.autorun ->
    menuSmod = (FView.byId 'menuSmod').modifier
    isMenuOpen = rxMenu.get 'isOpen'
    [opac, rot] = if isMenuOpen then [1, 0] else [0, Math.PI/2]
    menuSmod.setOpacity opac, duration: 500
    menuSmod.setTransform (Transform.rotateX rot), duration: 500

Template.menu.helpers
  size: "[undefined, #{Session.get 'menuHeight'}]"
  isMenuOpen: -> Session.get 'isMenuOpen'
