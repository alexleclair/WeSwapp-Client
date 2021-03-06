
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
			authToken = info.authResponse.accessToken


			$.ajaxSetup
				data:
					authToken: authToken



			$.get @urlRoot, (response)->
				info = response.response
				_this.set {info}
				

				_this.get_items()
				App.favorites.fetch {favorites: true}	
				

			$.get App.APIRoot + '/contacts/', (response)->
				_this.set {notifications:response.response}
				

				App.notifications_view.render()

			



	get_items: (callback)->
		_this = this

		$.get @urlRoot+"/items", (response)->
			items = response.response

			_.each items, (item)->
				item.image = item.medias[0]

			_this.set {items}

			callback() if callback?



