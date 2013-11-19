

class App.Routers.Router extends Backbone.Router



	routes: {
		'':'home'
		'items/:id':'items'
		'items/:id/swap':'item_swap'
		'users/:id':'users'
		'favorites':'favorites'
	}
			
		
	initialize: ->
		
	
	
		

	load_current_view: ->
		if @previous_view?
			@previous_view.remove()

		@previous_view = @current_view



		@current_view.render()


		App.menu_view.hide_menu()



	
	home: ->
		@current_view = new App.Views.ItemIndex
			collection: App.items
		
		
		App.items.fetch()
		this.load_current_view()



	items: (id)->
		if id == 'new'
			@current_view = new App.Views.ItemNew()
			
			this.load_current_view()


		else
			item = App.items.get(id)


			if item?
				@current_view = new App.Views.Item
					model: App.items.get id

				this.load_current_view()

			else
				item = new App.Models.Item {id: id}
				item.fetch()

				App.items.add item

				@current_view = new App.Views.Item
					model: item

				this.load_current_view()



	item_swap: (id)->
		item = App.items.get(id)


		if item?
			@current_view = new App.Views.ItemSwap
				item: App.items.get id
				swapper: App.swapper


		else
			item = new App.Models.Item {id: id}
			item.fetch()

			App.items.add item

			@current_view = new App.Views.ItemSwap
				item: item
				swapper: App.swapper


		App.swapper.get_items()

		this.load_current_view()




	users: (id)->
		user = App.users.get(id)


		if user?
			@current_view = new App.Views.User
				model: App.users.get id

			this.load_current_view()

		else
			user = new App.Models.User {id: id}
			user.fetch()

			App.users.add user

			@current_view = new App.Views.User
				model: user

			this.load_current_view()



	favorites: ->
		@current_view = new App.Views.ItemIndex
			collection: App.favorites

		
		this.load_current_view()




$ ->
	$('body').on 'click', 'a', (e)->
		e.preventDefault()

		App.router.navigate $(e.currentTarget).attr('href'),
			trigger: true
		




		
