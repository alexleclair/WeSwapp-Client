
class App.Models.Swapper extends Backbone.Model
	urlRoot: App.APIRoot + "/users/me"

	initialize: ->



	facebook_login: ->
		FB.login()

	facebook_logout: ->
		FB.logout()



	set_facebook_information: (info)->
		_this = this

		_this.set {auth_info: info.authResponse}

		if info.authResponse?
			authToken = info.authResponse.accessToken;
			$.get @urlRoot+"?authToken="+authToken, (response)->
				info = response.response				

				_this.set {info}
				App.favorites.fetch authToken

			$.get App.APIRoot + '/contacts/?authToken='+authToken, (response)->
				_this.set {notifications:response.response}
			



