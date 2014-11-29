Router.configure
  layoutTemplate: 'layout'
  trackPageView: true
Router.route '/', -> @render 'home'
Router.route '/grid'
Router.route '/animated'
Router.route '/loader'
