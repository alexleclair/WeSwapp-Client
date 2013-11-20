
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
		App.favorites.add this

		$.post App.APIRoot+'/favorites/'+this.attributes.id, {active:1}
	
	
	remove_from_favorites: ->
		this.set {favorited: false}
		App.favorites.remove this
		
		$.post App.APIRoot+'/favorites/'+this.attributes.id, {active:0}
