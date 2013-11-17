
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
			


				_this.get_items()

			



	get_items: (callback)->
		_this = this

		$.get @urlRoot+"/items?authToken="+_this.get("auth_info").accessToken, (response)->
			items = response.response

			_.each items, (item)->
				item.image = item.medias[0]

			_this.set {items}

			callback() if callback?



