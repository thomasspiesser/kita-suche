FlowRouter.route '/',
  name: 'home'
  action: ->
    BlazeLayout.render 'layout', content: 'main'

FlowRouter.route '/insert-new-kita',
  action: ->
    BlazeLayout.render 'layout', content: 'insertNewKita'