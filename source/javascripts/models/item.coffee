
class App.Models.Item extends Backbone.Model
	urlRoot: App.APIRoot + "/items/"

	initialize: ->


	parse: (response)->
		if response.response?
			response.response 

		else
			response



	add_to_favorites: ->
		this.set {favorited: true}
		$.post App.APIRoot+'/favorites/'+this.attributes.id+'?authToken='+App.swapper.attributes.auth_info.accessToken,{active:1}
	
	remove_from_favorites: ->
		this.set {favorited: false}
		$.post App.APIRoot+'/favorites/'+this.attributes.id+'?authToken='+App.swapper.attributes.auth_info.accessToken,{active:0}
