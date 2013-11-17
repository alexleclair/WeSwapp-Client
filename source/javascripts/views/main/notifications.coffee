class App.Views.Notifications extends Backbone.View

	el: $("#app__notifications")
	menu_el: $("#app__header__btn--notifications")

	template: Mustache.compile $("#source_templates_notifications").html()
	notifications_template: Mustache.compile $("#source_templates_notifications_item").html()
	
	
	
	events: {
		"click #app__nav__link--facebook": "facebook_login"
		"click #app__nav__link--logout": "facebook_logout"
	}
	
	
	
	
	initialize: ->
		$(this.menu_el).on "touchstart click", this.toggle_menu

		@model.on "change", this.render, this
	
	
	
	render: ->
		$bell = $('#app__header__btn--notifications');
		$count = $bell.find('.count');

		items = @model.attributes.notifications;
		console.log 'Model', @model.attributes
		if items?
			this.$el.html @template(items)
			this.render_notifications()
		count = '';
		if items? && items.unread_count > 0
			count = items.unread_count;
			$bell.addClass('unread');
		else
			$bell.removeClass('unread');

		$count.text(count)
		
		this


	render_notifications: ->
		_this = this


		this.$el.html ""

		_.each @model.attributes.notifications.contacts, (item)->
			classes = []
			user = {}
			if item.is_seen
				classes.push('seen');
			if item.isReceived
				classes.push('received');
			if item.isSent
				classes.push('sent');

			item.classes = classes.join(' ');
			item.user = user;
			if item.item_initiator.user_id == App.swapper.attributes.info.id
				item.is_initiator = true;
				item.you = item.user_initiator;
				item.them = item.item_requested.user;
				item.their_item = item.item_requested;
				item.your_item = item.item_initiator;
			else
				item.is_initiator = false;
				item.them = item.user_initiator;
				item.you = item.item_requested.user;
				item.your_item = item.item_requested;
				item.their_item = item.item_initiator;

			item.gender_word = 'their';
			if item.them.gender == 'male'
				item.gender_word = 'his'
			if item.them.gender == 'female'
				item.gender_word = 'her'

			_this.add_notification item


	add_notification: (item)->
		this.$el.append @notifications_template(item)


	toggle_menu: (e)->
		e.stopImmediatePropagation()

		$("#app__header__btn--notifications").toggleClass "app__header__btn--active"
		$("#app__notifications").toggleClass "app__nav--active"


	hide_menu: (e)->
		e.stopImmediatePropagation() if e?

		$("#app__header__btn--menu").removeClass "app__header__btn--active"
		$("#app__notifications").removeClass "app__nav--active"


	facebook_login: (e)->
		e.preventDefault()

		App.swapper.facebook_login()

	facebook_logout: (e)->
		e.preventDefault()

		App.swapper.facebook_logout()


	
