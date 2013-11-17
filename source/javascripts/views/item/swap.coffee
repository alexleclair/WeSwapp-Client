class App.Views.ItemSwap extends Backbone.View

	el: $("#app")
	
	template: Mustache.compile $("#source_templates_items_swap").html()


	events: {
		"click .js-proposal":"select_proposal"
	}

	
	
	initialize: (options)->
		@item = options.item
		@swapper = options.swapper

		@item.on "change", this.render, this
		@swapper.on "change:items", this.render, this
		
	
	render: ->
		if @item.get("medias")? or !@item.has("image")?
			@item.set {image: @item.get("medias")[0]} 
			@item.set {date: new Date(@item.get("created_at")).toDateString()} 


		data = {}
		data.item = @item.attributes
		data.swapper_items = App.swapper.get("items")

		this.$el.html @template(data)
		
		this



	select_proposal: (e)->
		$(".js-proposal").removeClass "proposal--selected"
		$(e.currentTarget).addClass "proposal--selected"