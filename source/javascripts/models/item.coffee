
class App.Models.Item extends Backbone.Model
	urlRoot: App.APIRoot + "/items/"

	initialize: ->


	parse: (response)->
		if response.response?
			response.response 

		else
			response