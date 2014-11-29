Template.animated.rendered = ->
  button = FView.byId 'button'
  console.log 'Button', button
  buttonState = true
  button.children[0].view.on 'click', ->
    button.children[1].view.setShape Number buttonState
    buttonState = not buttonState
