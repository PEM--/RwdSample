Template.home.helpers
  width: -> rwindow.innerWidth()
  height: -> rwindow.innerHeight()

Template.home.rendered = ->
  ga 'send', 'event', 'init', 'init'
  content = (FView.byId 'content').surface
  content.on 'click', ->
    rxMenu.set 'isOpen', (not rxMenu.get 'isOpen')
