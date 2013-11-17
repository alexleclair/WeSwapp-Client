




class App.Routers.Router extends Backbone.Router



	routes: {
		'':'home'
	}
			
		
	initialize: ->
	
	
	
		
	
	home: ->
		@current_view = new App.Views.ItemIndex
			collection: App.items
		
		
		App.items.fetch()
		@current_view.render()
		
		

		


		
		
		  

		
		