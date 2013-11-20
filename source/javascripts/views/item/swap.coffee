class App.Views.ItemSwap extends Backbone.View


	template: Mustache.compile $("#source_templates_items_swap").html()


	events: {
		"click .js-proposal":"select_proposal"
		"click .button--swapp-item":"swapp_item"
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
		data.swapper_items = App.swapper.get("items") if App.swapper.has("items")

		console.log data

		this.$el.html @template(data)
		App.wrapper.html this.$el
		
		this


	swapp_item: (e)->
		e.preventDefault()

		$.post App.APIRoot + '/contacts/?authToken='+App.swapper.attributes.auth_info.accessToken, 
			requested_item_id:@item.attributes.id
			item_id:$('ul.proposals li.proposal--selected').attr('data-item-id')
		, (response)=>
			$.get App.APIRoot + '/contacts/?authToken='+App.swapper.attributes.auth_info.accessToken, (response)->
				App.notifications_view.model.attributes.notifications = response.response;
				App.notifications_view.model.trigger('change');
			$('#app__header__btn--notifications').trigger('click');
			App.router.navigate '/items/' + @item.attributes.id,
            	trigger:true
			





	select_proposal: (e)->
		console.log e

		$(".js-proposal").removeClass "proposal--selected"
		$(e.currentTarget).addClass "proposal--selected"





