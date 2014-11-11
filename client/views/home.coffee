Template.home.helpers
  size: -> "[#{rwindow.innerWidth()},#{rwindow.innerHeight()}]"

Template.home.rendered = ->
  content = (FView.byId 'content').surface
  content.on 'click', ->
    rxMenu.set 'isOpen', (not rxMenu.get 'isOpen')
