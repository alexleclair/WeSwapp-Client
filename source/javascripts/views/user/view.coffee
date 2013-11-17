class App.Views.User extends Backbone.View

	el: $("#app")
	
	template: Mustache.compile $("#source_templates_users_view").html()
	item_template: Mustache.compile $("#source_templates_items_index_item").html()
	
	
	initialize: ->
		@model.on "sync", this.render, this
		
	
	render: ->
		this.render_items();

		#_date = @model.attributes.created_at.split('-')
		monthNames = ['','Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];


		#@model.set {date: monthNames[parseInt(_date[1])]+'. '+_date[0]};
		this.$el.html @template(@model.attributes)
		
		this


	render_items: ->
		_this = this
		_.each @model.attributes.items, (item)->
			item.image =  item.medias[0]
			_this.add_item item


	add_item: (item)->
		this.$el.find("section.items").append this.item_template(item)