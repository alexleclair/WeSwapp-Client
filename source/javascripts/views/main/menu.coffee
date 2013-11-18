class App.Views.Menu extends Backbone.View

	el: $("#app__nav")
	menu_el: $("#app__header__btn--menu")

	template: Mustache.compile $("#source_templates_menu").html()
	
	
	
	events: {
		"click #app__nav__link--facebook": "facebook_login"
		"click #app__nav__link--logout": "facebook_logout"
	}
	
	
	
	
	initialize: ->
		$(this.menu_el).on "touchstart", this.toggle_menu
		$(this.menu_el).on "click", this.toggle_menu

		@model.on "change", this.render, this
	
	
	
	render: ->
		this.$el.html @template(@model.attributes)
		
		this


	toggle_menu: (e)->
		e.preventDefault()
		e.stopImmediatePropagation()

		$("#app__header__btn--menu").toggleClass "app__header__btn--active"
		$("#app__nav").toggleClass "app__nav--active"


	hide_menu: (e)->
		e.stopImmediatePropagation() if e?

		$("#app__header__btn--menu").removeClass "app__header__btn--active"
		$("#app__nav").removeClass "app__nav--active"


	facebook_login: (e)->
		e.preventDefault()

		App.swapper.facebook_login()

	facebook_logout: (e)->
		e.preventDefault()

		App.swapper.facebook_logout()


	
