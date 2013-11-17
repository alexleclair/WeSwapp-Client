class App.Views.User extends Backbone.View

	el: $("#app")
	
	template: Mustache.compile $("#source_templates_users_view").html()
	
	
	initialize: ->
		@model.on "sync", this.render, this
		
	
	render: ->
		console.log @model
		this.$el.html @template(@model.attributes)
		
		this