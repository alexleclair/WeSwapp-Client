
class App.Models.Item extends Backbone.Model
	urlRoot: App.APIRoot + "/items/"

	initialize: ->


	parse: (response)->
		if response.response?
			response.response 

		else
			response

	addFavorite: =>
		$.post App.APIRoot+'/favorites/'+this.attributes.id+'?authToken='+App.swapper.attributes.auth_info.accessToken,{active:1}
	removeFavorite: =>
		$.post App.APIRoot+'/favorites/'+this.attributes.id+'?authToken='+App.swapper.attributes.auth_info.accessToken,{active:0}
