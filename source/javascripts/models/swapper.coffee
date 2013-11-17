
class App.Models.Swapper extends Backbone.Model
	urlRoot: "https://5c4ae6ba.ngrok.com/users/me"

	initialize: ->



	facebook_login: ->
		FB.login()

	facebook_logout: ->
		FB.logout()



	set_facebook_information: (info)->
		_this = this

		_this.set {auth_info: info.authResponse}

		if info.authResponse?
			$.get @urlRoot+"?authToken="+info.authResponse.accessToken, (response)->
				info = response.response

				_this.set {info}


				_this.get_items()

			



	get_items: (callback)->
		_this = this

		$.get @urlRoot+"/items?authToken="+_this.get("auth_info").accessToken, (response)->
			items = response.response

			_.each items, (item)->
				item.image = item.medias[0]

			_this.set {items}

			callback() if callback?



