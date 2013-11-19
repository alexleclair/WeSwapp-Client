class App.Views.Item extends Backbone.View
	
	template: Mustache.compile $("#source_templates_items_view").html()
	
	
	initialize: ->
		App.swapper.on "change:info", this.render, this
		@model.on "change:title", this.render, this

		
	
	render: ->
		if @model.get("medias")? or !@model.has("image")?
			@model.set 
				image: @model.get("medias")[0]
				date: new Date(@model.get("created_at")).toDateString()
				


		@model.set {is_mine: @model.get("user_id")==App.swapper.get("info").id} if App.swapper.get("info")?


		this.$el.html @template(@model.attributes)
		App.wrapper.html this.$el
		
		this