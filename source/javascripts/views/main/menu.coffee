class App.Views.Menu extends Backbone.View

	el: $("#app__nav")
	menu_el: $("#app__header__btn--menu")

	template: Mustache.compile $("#source_templates_menu").html()
	
	
	
	events: {
		"click #app__nav__link--facebook": "facebook_login"
	}
	
	
	
	
	initialize: ->
		$(this.menu_el).on "touchstart click", this.toggle_menu
		$(this.menu_el).on "click", this.hide_menu

		@model.on "change", this.render, this
	
	
	
	render: ->
		this.$el.html @template
		
		this


	toggle_menu: (e)->
		e.stopImmediatePropagation()

		$("#app__header__btn--menu").toggleClass "app__header__btn--active"
		$("#app__nav").toggleClass "app__nav--active"


	facebook_login: (e)->
		e.preventDefault()

		console.log "clicked"

		App.swapper.facebook_login()


	
