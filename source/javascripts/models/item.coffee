
class App.Models.Item extends Backbone.Model
	urlRoot: "https://5c4ae6ba.ngrok.com/items/"

	initialize: ->


	parse: (response)->
		if response.response?
			response.response 

		else
			response