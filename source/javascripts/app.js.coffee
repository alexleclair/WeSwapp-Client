
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
	APIRoot: 'https://5c4ae6ba.ngrok.com'
	
	
	
	init: ->
		
		@items = new App.Collections.Items()
		@swapper = new App.Models.Swapper()
		@users = new App.Collections.Users()
		@notifications = new App.Collections.Notifications()




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
  
  
  
  
  
  
  
  
  
  
  
  