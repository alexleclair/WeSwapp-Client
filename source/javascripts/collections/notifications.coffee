

class App.Collections.Notifications extends Backbone.Collection
	
	model: App.Models.Item
	
	
	url: App.APIRoot + "/contacts/"


	parse: (response)->
		response.response

		