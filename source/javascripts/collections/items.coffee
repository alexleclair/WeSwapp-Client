

class App.Collections.Items extends Backbone.Collection
	
	model: App.Models.Item


	url: App.APIRoot

	fetch: (options)->
		
		_this = this

		user_id = options.user_id if options?
		user_url = ''
		if user_id?
			user_url = '/users/'+user_id


		token = options.token if options?
		if token? && App.swapper.attributes.auth_info? && App.swapper.attributes.auth_info.accessToken?
			token = App.swapper.attributes.auth_info.accessToken
			token = '?authToken='+token

		else
			token = ''



		path = "/items"
		if options? and options.favorites?
			path = "/favorites/"

		
		$.get @url+user_url+path+token, (response)->
			_this.reset _this.parse(response)
			_this.trigger('sync')





	parse: (response)->
		response.response

		