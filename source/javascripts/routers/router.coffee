

class App.Routers.Router extends Backbone.Router



	routes: {
		'':'home'
		'items/:id':'items'
		'items/:id/swap':'item_swap'
		'users/:id':'users'
		'proposals/:id':'proposals'
		'favorites':'favorites'
	}
			
		
	initialize: ->
		
	
	
		

	load_current_view: ->
		if @previous_view?
			@previous_view.remove()

		@previous_view = @current_view



		@current_view.render()


		App.menu_view.hide_menu()
		App.notifications_view.hide_menu()



	
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
		if this.check_auth_info()
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



	proposals: (id)->
		if this.check_auth_info()
			proposal = new App.Models.Proposal {id: id}
			

			@current_view = new App.Views.Proposal
				model: proposal


			proposal.fetch()
			this.load_current_view()



	favorites: ->
		if this.check_auth_info()
			@current_view = new App.Views.ItemIndex
				collection: App.favorites

			
			this.load_current_view()




	check_auth_info: ->
		if App.swapper.get("auth_info")?
			true

		else
			this.navigate "",
				trigger: true

			false




$ ->
	$('body').on 'click', 'a', (e)->
		e.preventDefault()

		App.router.navigate $(e.currentTarget).attr('href'),
			trigger: true
		




		
