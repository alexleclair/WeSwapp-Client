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

		@collection.fetch()
		
		this
		
		
	render_items: ->
		_this = this


		this.$el.find("#items").html ""

		@collection.each (item)->
			item.set {image: item.get("medias")[0]}
			_this.add_item item


	add_item: (item)->
		$template = $(@item_template(item.attributes));
		$template.find('.item__star').on 'click', (e)->
			e.preventDefault();
			if $(this).is('.active')
				item.removeFavorite();
				$(this).removeClass('active');
			else
				item.addFavorite();
				$(this).addClass('active');

			return false;
		this.$el.find("#items").append $template


	remove_item: (item)->

