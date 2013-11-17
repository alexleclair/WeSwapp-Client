class App.Views.ItemIndex extends Backbone.View

	el: $("#app")
	

	template: Mustache.compile $("#source_templates_items_index").html()
	item_template: Mustache.compile $("#source_templates_items_index_item").html()
	
	
	
	events: {
	}
	
	
	
	
	initialize: ->
		@collection.on "sync", this.render_items, this
		@collection.on "remove", this.render_items, this
	
	
	
	render: ->
		this.$el.html @template
		
		this
		
		
	render_items: ->
		_this = this

		@collection.each (item)->
			item.set {image: item.get("medias")[0]}
			_this.add_item item


	add_item: (item)->
		this.$el.find("#items").append @item_template(item.attributes)


	remove_item: (item)->

