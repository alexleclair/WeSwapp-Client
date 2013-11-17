
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
	
	
	
	init: ->
		
		@items = new App.Collections.Items()
		@swapper = new App.Models.Swapper()




		@menu_view = new App.Views.Menu
			model: @swapper

		@menu_view.render()


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
  
  
  
  
  
  
  
  
  
  
  
  