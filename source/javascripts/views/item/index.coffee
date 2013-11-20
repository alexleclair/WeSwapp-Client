class App.Views.ItemIndex extends Backbone.View

	className: "grid"


	template: Mustache.compile $("#source_templates_items_index").html()
	item_template: Mustache.compile $("#source_templates_items_index_item").html()
	
	
	
	events: {
		"click .item__star":"toggle_favorite"
	}
	
	
	
	
	initialize: ->
		@collection.on "sync", this.render_items, this
		@collection.on "remove", this.render_items, this
		App.favorites.on "sync", this.render_items, this


	
	
	
	render: (options)->
		this.$el.html @template

		if options? and options.wrapper?
			options.wrapper.html this.$el

		else
			App.wrapper.html this.$el


		this.render_items()
		
		this
		
		
	render_items: ->
		_this = this


		this.$el.find("#items").html ""



		@collection.each (item)->
			item.set {image: item.get("medias")[0]} unless item.has("image")
			item.set {favorited: true} if App.favorites.get(item.id)?

			_this.add_item item



	add_item: (item)->
		this.$el.find("#items").append @item_template(item.attributes)


	remove_item: (item)->




	toggle_favorite: (e)->
		e.preventDefault()
		star = $(e.currentTarget)

		item = @collection.get(star.attr('data-id'))


		if star.is('.item__star--active')
			item.remove_from_favorites()
			star.removeClass('item__star--active')

		else
			item.add_to_favorites()
			star.addClass('item__star--active')





