class App.Views.Item extends Backbone.View

	el: $("#app")
	
	template: Mustache.compile $("#source_templates_items_view").html()
	
	
	initialize: ->
		@model.on "change", this.render, this
		
	
	render: ->
		if @model.get("medias")? or !@model.has("image")?
			@model.set {image: @model.get("medias")[0]} 
			@model.set {date: new Date(@model.get("created_at")).toDateString()} 

		console.log @model
		this.$el.html @template(@model.attributes)
		
		this