picts = [
  { url: '/eternal_snow_1366_911.jpg' }
  { url: '/fishing_party_1366_907.jpg' }
  { url: '/flowers_1366_908.jpg' }
  { url: '/foggy_night_1366_852.jpg' }
  { url: '/harbour_1366_921.jpg' }
  { url: '/louder_please_1366_908.jpg' }
]

Template.grid.helpers picts: -> picts

gridState = true
zWorld = -1000
zItem = -1.1 * zWorld

Template.grid.rendered = ->
  gridCtx = FView.byId 'gridCtx'
  gridCtx.view.context.setPerspective 1000

Template.gridItem.rendered = ->
  worldMod = (FView.byId 'gridWorld').modifier
  item = FView.byId @data.url
  itemMod = item.parent.modifier
  trans = new Transitionable 0
  item.view.on 'click', ->
    worldMod.transformFrom ->
      Transform.translate 0, 0, zWorld * Easing.inOutQuad trans.get()
    itemMod.transformFrom ->
      val = trans.get()
      rot = Transform.rotateY Math.PI*2*val
      z = Transform.translate 0, 0, zItem * Easing.inOutQuad val
      Transform.multiply z, rot
    trans.set Number not gridState
    trans.set (Number gridState), duration: 600, curve: 'linear'
    gridState = not gridState
