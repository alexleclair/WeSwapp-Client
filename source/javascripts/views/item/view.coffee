class App.Views.Item extends Backbone.View

	el: $("#app")
	
	template: Mustache.compile $("#source_templates_items_view").html()
	
	
	initialize: ->
		@model.on "sync", this.render, this
		
	
	render: ->
		console.log @model
		this.$el.html @template(@model.attributes)
		
		this