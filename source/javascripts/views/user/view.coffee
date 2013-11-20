class App.Views.User extends Backbone.View

	
	template: Mustache.compile $("#source_templates_users_view").html()
	item_template: Mustache.compile $("#source_templates_items_index_item").html()
	
	
	initialize: ->
		@model.on "change:firstname", this.render, this
		@model.on "change:items", this.render_items, this
		App.swapper.on "change:info", this.render, this

	
	render: ->
		if @model.attributes.created_at?
			_date = @model.attributes.created_at.split('-')
			monthNames = ['','Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

			@model.set {date: monthNames[parseInt(_date[1])]+'. '+_date[0]}
			@model.set {is_me: @model.id == App.swapper.get("info").id} if App.swapper.get("info")?


		this.$el.html @template(@model.attributes)
		App.wrapper.html this.$el


		this.render_items()
		
		this


	render_items: ->
		if @model.attributes.items?
			items = new App.Collections.Items(@model.attributes.items)

			@items_view = new App.Views.ItemIndex
				collection: items

			@items_view.render {wrapper: this.$el.find("#items"), user_id: @model.id}


