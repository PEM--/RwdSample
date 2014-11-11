Transform = famous.core.Transform
Engine = famous.core.Engine
famous.polyfills

mainCtx = Engine.createContext()
FView.mainCtx = mainCtx
mainCtx.setPerspective 0

FView.ready ->
  BkImageSurface = bkimagesurface.BkImageSurface
  FView.registerView 'BkImageSurface', BkImageSurface,
    add: (child_fview, child_options) ->
      @view[target].add child_fview
    attrUpdate: (key, value, oldValue, data, firstTime) ->
      switch key
        when 'sizemode'
          @view.setSizeMode BkImageSurface.SizeMode[value]
        when 'backface'
          if value
            @view.properties.webkitBackfaceVisibility = 'visible'
            @view.properties.backfaceVisibility = 'visible'
    famousCreatedPost: ->
      @pipeChildrenTo = if @parent.pipeChildrenTo? then \
        [ @view, @parent.pipeChildrenTo[0] ] else [ @view ]
  FView.registerView 'GridLayout', famous.views.GridLayout,
    famousCreatedPost: ->
      @pipeChildrenTo = if @parent.pipeChildrenTo? then \
        [ @view, @parent.pipeChildrenTo[0] ] else [ @view ]

rxMenu = new ReactiveDict

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

Template.grid.helpers
  picts: ->
    [
      { url: '/eternal_snow_1366_911.jpg' }
      { url: '/fishing_party_1366_907.jpg' }
      { url: '/flowers_1366_908.jpg' }
      { url: '/foggy_night_1366_852.jpg' }
      { url: '/harbour_1366_921.jpg' }
      { url: '/louder_please_1366_908.jpg' }
    ]

Template.grid.rendered = ->
  gridCtx = FView.byId 'gridCtx'
  gridCtx.view.context.setPerspective 1000

gridState = true

Transitionable = famous.transitions.Transitionable
Easing = famous.transitions.Easing

Template.gridItem.rendered = ->
  worldMod = (FView.byId 'gridWorld').modifier
  item = FView.byId @data.url
  itemMod = item.parent.modifier
  item.view.on 'click', ->
    zWorld = -1000
    zItem = 1100
    begin = if gridState then 0 else 1
    end = if gridState then 1 else 0
    trans = new Transitionable begin
    gridState = not gridState
    worldMod.transformFrom ->
      Transform.translate 0, 0, zWorld * Easing.inOutQuad trans.get()
    console.log 'Mod', itemMod
    console.log 'Surf', @
    initialSize = @getSize()
    console.log 'Initial size', initialSize
    itemMod.transformFrom ->
      val = trans.get()
      rot = Transform.rotateY Math.PI*2*val
      z = Transform.translate 0, 0, zItem * Easing.inOutQuad val
      Transform.multiply z, rot
    trans.set end, duration: 600, curve: 'linear'

Template.home.helpers
  size: -> "[#{rwindow.innerWidth()},#{rwindow.innerHeight()}]"

Template.home.rendered = ->
  content = (FView.byId 'content').surface
  content.on 'click', ->
    rxMenu.set 'isOpen', (not rxMenu.get 'isOpen')
