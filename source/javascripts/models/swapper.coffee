
class App.Models.Swapper extends Backbone.Model
	urlRoot: "https://5c4ae6ba.ngrok.com/users/me"

	initialize: ->



	facebook_login: ->
		FB.login()



	set_facebook_information: (info)->
		this.set {auth_info: info.authResponse}



