class App.Views.Tags extends Backbone.View

	el: $("#search")
	menu_el: $("#app__header__btn--search")
	
	
	
	events: {

	}
	
	
	
	
	initialize: ->
		$(this.menu_el).on "touchstart click", this.toggle_menu
	
	
	
	render: ->

		this



	toggle_menu: (e)->
		e.preventDefault()
		e.stopImmediatePropagation()

		$("#app__header__btn--search").toggleClass "app__header__btn--active"
		$("#search").toggleClass "search--opened"


	hide_menu: (e)->
		e.stopImmediatePropagation() if e?

		$("#app__header__btn--serach").removeClass "app__header__btn--active"
		$("#search").removeClass "search--opened"



	
