

class App.Collections.Users extends Backbone.Collection
	
	model: App.Models.User
	
	
	url: App.APIRoot + "/users"


	parse: (response)->
		response.response

		