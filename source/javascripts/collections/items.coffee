

class App.Collections.Items extends Backbone.Collection
	
	model: App.Models.Item
	
	
	url: App.APIRoot + "/items"


	parse: (response)->
		response.response

		