FView.ready ->
  @Transform = famous.core.Transform
  famous.core.famous

rxMenu = new ReactiveDict

Template.layout.rendered = ->
  FView.mainCtx.setPerspective 0
  BkImageSurface = bkimagesurface.BkImageSurface

Template.menu.rendered = ->
  rxMenu.set 'isOpen', true
  Tracker.autorun ->
    menuSmod = (FView.byId 'menuSmod').modifier
    isMenuOpen = rxMenu.get 'isOpen'
    [opac, rot] = if isMenuOpen then [1, 0] else [0, Math.PI/2]
    menuSmod.setOpacity opac, duration: 300
    menuSmod.setTransform (Transform.rotateX rot), duration: 300

Template.menu.helpers
  size: "[undefined, #{Session.get 'menuHeight'}]"
  isMenuOpen: -> Session.get 'isMenuOpen'

Template.home.helpers
  width: -> rwindow.innerWidth()
  height: -> rwindow.innerHeight()

Template.home.rendered = ->
  content = (FView.byId 'content').surface
  console.log content
  content.on 'click', ->
    rxMenu.set 'isOpen', (not rxMenu.get 'isOpen')
