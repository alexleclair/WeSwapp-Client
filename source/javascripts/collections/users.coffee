

class App.Collections.Users extends Backbone.Collection
	
	model: App.Models.User
	
	
	url: "https://5c4ae6ba.ngrok.com/users"


	parse: (response)->
		response.response

		