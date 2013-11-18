

class App.Collections.Favorites extends Backbone.Collection
	
	model: App.Models.Item
	
	
	url: App.APIRoot + "/favorites/"

	fetch:(token)=>
		if !token? && App.swapper.attributes.auth_info? && App.swapper.attributes.auth_info.accessToken?
			token = App.swapper.attributes.auth_info.accessToken;

		if !token?
			token = '';
		_this = this
		$.get @url+'?authToken='+token, (response)->
			_this.reset();
			_this.set _this.parse(response)
			_this.trigger('sync')

	parse: (response)->
		#App.swapper.set {notifications:response.response}
		response.response

		