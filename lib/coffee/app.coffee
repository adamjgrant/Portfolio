window.A$     = new Object()
KS            = require '../../lib-core/coffee/app'
A$.settings   = require './settings'
A$.categories = require('./categories').reverse()
A$.projects   = require('./projects').reverse()
A$.bind       = require './bind'

document.addEventListener 'DOMContentLoaded', ->
  A$.bind()
