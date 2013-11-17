
class App.Models.User extends Backbone.Model
	urlRoot: "https://5c4ae6ba.ngrok.com/users/"

	initialize: ->

	parse: (response)->
		if response.response?
			response.response 

		else
			response


