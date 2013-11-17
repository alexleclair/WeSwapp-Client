

class App.Collections.Items extends Backbone.Collection
	
	model: App.Models.Item
	
	
	url: "https://5c4ae6ba.ngrok.com/items"


	parse: (response)->
		response.response

		