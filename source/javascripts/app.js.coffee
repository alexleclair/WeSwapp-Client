
##################################################################################
#
#	We Swapp
#   Phillip Malboeuf 
#
##################################################################################


window.App =
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}
	APIRoot: 'https://www.weswapp.com/api'
	
	
	
	init: ->
		
		@items = new App.Collections.Items()
		@swapper = new App.Models.Swapper()
		@users = new App.Collections.Users()
		@notifications = new App.Collections.Notifications()
		@favorites = new App.Collections.Favorites()




		@menu_view = new App.Views.Menu
			model: @swapper

		@menu_view.render()

		@notifications_view = new App.Views.Notifications
			model: @swapper

		@notifications_view.render()


		@router = new App.Routers.Router()
		
		Backbone.history.start()
		
		
		

$ ->
	if $('body').hasClass 'landing'
		$('.slides').cycle({
			speed: 800,
			timeout: 2300,
			slides: '> div'
		});


	
	App.init()
  
  
  
  
  
  
  
  
  
  
  
  