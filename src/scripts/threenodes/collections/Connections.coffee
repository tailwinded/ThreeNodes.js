define [
  'use!Underscore', 
  'use!Backbone',
  'order!threenodes/models/Connection',
  'order!threenodes/views/ConnectionView',
], (_, Backbone) ->
  "use strict"
  
  class ThreeNodes.ConnectionsCollection extends Backbone.Collection
    model: ThreeNodes.Connection
    
    initialize: (models, options) =>
      @indexer = options.indexer
      @bind "connection:removed", (c) => @remove(c)
      super
    
    render: () =>
      @each (c) -> c.render()
    
    create: (model, options) =>
      if !options then options = {}
      model.indexer = @indexer
      model = @_prepareModel(model, options)
      if !model
        return false
      @add(model, options)
      return model
    
    removeAll: () =>
      @remove(@models)
    