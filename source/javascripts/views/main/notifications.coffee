class App.Views.Notifications extends Backbone.View

	el: $("#app__notifications")
	menu_el: $("#app__header__btn--notifications")

	template: Mustache.compile $("#source_templates_notifications").html()
	notifications_template: Mustache.compile $("#source_templates_notifications_item").html()
	
	
	
	events: {

	}
	
	
	
	
	initialize: ->
		$(this.menu_el).on "touchstart click", this.toggle_menu

		@model.on "change", this.render, this
	
	
	
	render: ->
		$bell = $('#app__header__btn--notifications');
		$count = $bell.find('.count');

		items = @model.attributes.notifications;
		
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
			if item.is_seen
				classes.push('seen')
			if item.isReceived
				classes.push('received')
			if item.isSent
				classes.push('sent')

			item.classes = classes.join(' ')

			if App.swapper.attributes.info? and item.item_initiator.user_id == App.swapper.attributes.info.id
				item.is_initiator = true
				item.you = item.user_initiator
				item.them = item.item_requested.user
				item.their_item = item.item_requested
				item.your_item = item.item_initiator
			else
				item.is_initiator = false;
				item.them = item.user_initiator
				item.you = item.item_requested.user
				item.your_item = item.item_requested
				item.their_item = item.item_initiator


			item.your_item.image = item.your_item.medias[0]
			item.their_item.image = item.their_item.medias[0]



			item.is_pending = false
			item.is_accepted = false
			item.is_rejected = false
			if item.status == 'pending'
				item.is_pending = true
			if item.status == 'accepted'
				item.is_accepted = true
			if item.status == 'rejected'
				item.is_rejected = true

			item.gender_word = 'their';
			if item.them.gender == 'male'
				item.gender_word = 'his'
			if item.them.gender == 'female'
				item.gender_word = 'her'

			_this.add_notification item




	add_notification: (item)->
		$item = $(@notifications_template(item));
		this.$el.append $item;


	toggle_menu: (e)->
		e.preventDefault()
		e.stopImmediatePropagation()

		$("#app__header__btn--notifications").toggleClass "app__header__btn--active"
		$("#app__notifications").toggleClass "app__nav--active"


	hide_menu: (e)->
		e.stopImmediatePropagation() if e?

		$("#app__header__btn--notifications").removeClass "app__header__btn--active"
		$("#app__notifications").removeClass "app__nav--active"



	
