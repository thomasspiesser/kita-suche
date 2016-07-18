FlowRouter.route '/',
  name: 'home'
  action: ->
    BlazeLayout.render 'layout', content: 'main'

FlowRouter.route '/insert-new-kita',
  action: ->
    BlazeLayout.render 'layout', content: 'insertNewKita'

FlowRouter.route '/notes',
  action: ->
    BlazeLayout.render 'layout', content: 'notes'
