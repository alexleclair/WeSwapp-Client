class App.Views.ItemNew extends Backbone.View
	url: App.APIRoot + "/items"
	imageData:null

	template: Mustache.compile $("#source_templates_items_new").html()
	
	
	initialize: ->
		
	
	render: ->
		this.$el.html @template()
		App.wrapper.html this.$el

		_this = this


		handleImage = (e)->
			file = imageLoader.files[0]
			mpImg = new MegaPixImage(file)
			resImg = new Image();
			mpImg.render(resImg, { maxWidth: 1000, maxHeight: 1000, quality: 0.8 });

			resCanvas1 = document.createElement("canvas");
			mpImg.render(resCanvas1, { maxWidth: 1000, maxHeight: 1000 });
			resCanvas2 = document.createElement("canvas");
			
			if ((navigator.userAgent.match(/iPhone/i)) || (navigator.userAgent.match(/iPod/i)))
				mpImg.render(resCanvas2, { maxWidth: 1000, maxHeight: 1000, orientation: 6})

			else
				mpImg.render(resCanvas2, { maxWidth: 1000, maxHeight: 1000})


			setTimeout ->
				canvas.width=1000
				canvas.height=1000
				ctx.drawImage(resCanvas2,0,0);

				_this.imageData = resCanvas2.toDataURL 'image/jpeg';
			, 600




		imageLoader = document.getElementById 'imageLoader'
		imageLoader.addEventListener 'change', handleImage, false
		canvas = document.getElementById 'imageCanvas'
		ctx = canvas.getContext '2d'



		$(@el).find('a.upload-field').click (e)->
			e.preventDefault();
			$('#imageLoader').click();
			return false;
		$(@el).find('a.submit').click (e)->
			e.preventDefault();
			$form = $('#item-new-form');
			if !_this.imageData?
				alert 'Please enter submit and image'
				return false;
			if $form.find('[name="title"]').val() == ''
				alert 'Please enter a title'
				return false;
			if $form.find('[name="description"]').val() == ''
				alert 'Please enter a description'
				return false;
			_this.submit.call(_this);
			return false;



		


		this

		



	submit: ->
		$form = $('#item-new-form');
		jsonBody = 
			title:$form.find('[name="title"]').val()
			description:$form.find('[name="description"]').val()
			media:@imageData;
		$.post @url+'?authToken='+App.swapper.attributes.auth_info.accessToken, jsonBody, (data)->
			if data.code != 200
				alert data.error
			else
				App.router.navigate '/items/' + data.response.id, 
					trigger:true
