module.exports =
  (Project) ->
    project ?= new Project
      name:          'Intro to Tech'
      audience:      'Anyone interested'
      prerequisites: {}
      requirements:
        time:        'unknown'
        location:    'online'
      scope:
        history:     'High-level history of Unix from Multics to GNU/Linux'

Object.assign module.exports,
  imports: [ 'Project' ]
