
class App.Models.Notification extends Backbone.Model
	urlRoot: App.APIRoot + "/contact/"

	initialize: ->


	parse: (response)->
		if response.response?
			response.response 

		else
			response