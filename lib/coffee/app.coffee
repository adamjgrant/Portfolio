window.A$            = new Object()
KS            = require '../../lib-core/coffee/app'
A$.categories = require './categories'
A$.projects   = require './projects'
A$.bind       = require './bind'

document.addEventListener 'DOMContentLoaded', ->
  A$.bind()
