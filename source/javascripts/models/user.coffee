
class App.Models.User extends Backbone.Model
	urlRoot: "https://5c4ae6ba.ngrok.com/users/"

	initialize: ->
		this.load_items();

	parse: (response)->
		if response.response?
			response.response 

		else
			response


	load_items: ->
		_this = this;
		$.get @urlRoot+this.attributes.id+'/items', (data)->
			_this.set {items: data.response}