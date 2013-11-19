class App.Views.User extends Backbone.View

	
	template: Mustache.compile $("#source_templates_users_view").html()
	item_template: Mustache.compile $("#source_templates_items_index_item").html()
	
	
	initialize: ->
		@model.on "change", this.render, this
		App.swapper.on "change:info", this.render, this

	
	render: ->
		

		if @model.attributes.created_at?
			_date = @model.attributes.created_at.split('-')
			monthNames = ['','Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

			@model.set {date: monthNames[parseInt(_date[1])]+'. '+_date[0]}
			@model.set {is_me: @model.id == App.swapper.get("info").id} if App.swapper.get("info")?


		console.log @model
		this.$el.html @template(@model.attributes)
		App.wrapper.html this.$el


		this.render_items()
		
		this


	render_items: ->
		_this = this
		_.each @model.attributes.items, (item)->
			item.image =  item.medias[0]
			_this.add_item item


	add_item: (item)->
		console.log item

		this.$el.find(".items").append this.item_template(item)