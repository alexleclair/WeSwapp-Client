




class App.Routers.Router extends Backbone.Router



	routes: {
		'':'home'
		'items/:id':'items'
		'users/:id':'users'
	}
			
		
	initialize: ->
		
	
	
		

	load_current_view: ->
		App.menu_view.hide_menu()
		@current_view.render()


	
	home: ->
		@current_view = new App.Views.ItemIndex
			collection: App.items
		
		
		App.items.fetch()
		this.load_current_view()



	items: (id)->
		if id == 'new'
			@current_view = new App.Views.ItemNew();
			@current_view.render();
			return;
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



$ ->
	$('body').on 'click', 'a', (e)->
		e.preventDefault()

		App.router.navigate $(e.currentTarget).attr('href'),
			trigger: true
		




		
