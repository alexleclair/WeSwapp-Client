

class App.Collections.Items extends Backbone.Collection
	
	model: App.Models.Item
	
	
	url: App.APIRoot + "/items"

	fetch:(token)=>
		if !token? && App.swapper.attributes.auth_info? && App.swapper.attributes.auth_info.accessToken?
			token = App.swapper.attributes.auth_info.accessToken;

		if !token?
			token = '';
		else
			token = '?authToken='+token
		_this = this
		$.get @url+token, (response)->
			_this.reset();
			_this.set _this.parse(response)
			_this.trigger('sync')

	parse: (response)->
		response.response

		