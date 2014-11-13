famous.polyfills

@Transform = famous.core.Transform
@Engine = famous.core.Engine
@Transitionable = famous.transitions.Transitionable
@Easing = famous.transitions.Easing

mainCtx = Engine.createContext()
FView.mainCtx = mainCtx
mainCtx.setPerspective 0

FView.ready ->
  FView.registerView 'GridLayout', famous.views.GridLayout
