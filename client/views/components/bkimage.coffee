FView.ready ->
  BkImageSurface = bkimagesurface.BkImageSurface
  FView.registerView 'BkImageSurface', BkImageSurface,
    add: (child_fview, child_options) ->
      @view[target].add child_fview
    attrUpdate: (key, value, oldValue, data, firstTime) ->
      switch key
        when 'sizemode'
          @view.setSizeMode BkImageSurface.SizeMode[value]
        when 'backface'
          if value
            @view.properties.webkitBackfaceVisibility = 'visible'
            @view.properties.backfaceVisibility = 'visible'
    famousCreatedPost: ->
      @pipeChildrenTo = if @parent.pipeChildrenTo? then \
        [ @view, @parent.pipeChildrenTo[0] ] else [ @view ]
  FView.registerView 'GridLayout', famous.views.GridLayout,
    famousCreatedPost: ->
      @pipeChildrenTo = if @parent.pipeChildrenTo? then \
        [ @view, @parent.pipeChildrenTo[0] ] else [ @view ]
