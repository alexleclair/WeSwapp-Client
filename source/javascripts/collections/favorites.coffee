

class App.Collections.Favorites extends Backbone.Collection
	
	model: App.Models.Item
	
	
	url: App.APIRoot + "/favorites/"


	parse: (response)->
		response.response

		