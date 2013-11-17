




class App.Routers.Router extends Backbone.Router



	routes: {
		'':'home'
		'items/:id':'items'
		'users/:id':'users'
	}
			
		
	initialize: ->
		
	
	
		
	
	home: ->
		@current_view = new App.Views.ItemIndex
			collection: App.items
		
		
		App.items.fetch()
		@current_view.render()



	items: (id)->
		if id == 'new'
			@current_view = new App.Views.ItemNew();
			@current_view.render();
			return;
		item = App.items.get(id)


		if item?
			@current_view = new App.Views.Item
				model: App.items.get id

			@current_view.render()

		else
			item = new App.Models.Item {id: id}
			item.fetch()

			App.items.add item

			@current_view = new App.Views.Item
				model: item

			@current_view.render()

	users: (id)->
		user = App.users.get(id)


		if user?
			@current_view = new App.Views.User
				model: App.users.get id

			@current_view.render()

		else
			user = new App.Models.User {id: id}
			user.fetch()

			App.users.add user

			@current_view = new App.Views.User
				model: user

			@current_view.render()



$ ->
	$('body').on 'click', 'a', (e)->
		e.preventDefault()

		App.router.navigate $(e.currentTarget).attr('href'),
			trigger: true
		




		
