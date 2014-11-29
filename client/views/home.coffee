Template.home.helpers
  width: -> rwindow.innerWidth()
  height: -> rwindow.innerHeight()

Template.home.rendered = ->
  content = (FView.byId 'content').surface
  content.on 'click', ->
    rxMenu.set 'isOpen', (not rxMenu.get 'isOpen')
