class App.Views.Proposal extends Backbone.View

	
	template: Mustache.compile $("#source_templates_proposals_view").html()



	events: {
		"click #proposal__refuse_button":"refuse_proposal"
		"click #proposal__accept_button":"accept_proposal"
	}


	
	
	initialize: ->
		@model.on "change", this.render, this

	
	render: ->
		item = @model.attributes


		if item.item_initiator?
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




		this.$el.html @template(item)
		App.wrapper.html this.$el


		this.delegateEvents()


		
		this



	refuse_proposal: (e)->
		e.preventDefault()

		@model.set {status: 'rejected'}
		$.post App.APIRoot + '/contacts/'+@model.attributes.id, {status:'rejected'}
		


	accept_proposal: (e)->
		e.preventDefault()

		@model.set {status: 'accepted'}
		$.post App.APIRoot + '/contacts/'+@model.attributes.id, {status:'accepted'}

