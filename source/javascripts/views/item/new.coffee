class App.Views.ItemNew extends Backbone.View
	url: "https://5c4ae6ba.ngrok.com/items?authToken=AUTH_ICI"
	el: $("#app")
	imageData:null

	template: Mustache.compile $("#source_templates_items_new").html()
	
	
	initialize: ->
		
	
	render: ->
		this.$el.html @template()
		_this = this;
		handleImage = (e)->
			reader = new FileReader()
			canvasCopy = document.createElement("canvas");
			copyContext = canvasCopy.getContext("2d");
			reader.onload = (event)->
				img = new Image()
				img.onload = ()->
					ratio = 1;
					maxWidth = 1000;
					maxHeight = 1000;
					if(img.width > maxWidth)
						ratio = maxWidth / img.width
					else if(img.height > maxHeight)
						ratio = maxHeight / img.height
					canvasCopy.width = img.width;
					canvasCopy.height = img.height;
					copyContext.drawImage(img, 0, 0);


					canvas.width = img.width * ratio
					canvas.height = img.height * ratio
					ctx.drawImage(img, 0, 0, ratio*img.width, ratio*img.height, 0, 0, canvas.width, canvas.height);
					_this.imageData = canvas.toDataURL 'image/jpeg';

				img.src = event.target.result
			reader.readAsDataURL e.target.files[0]

		imageLoader = document.getElementById 'imageLoader' ;
		imageLoader.addEventListener 'change', handleImage, false;
		canvas = document.getElementById 'imageCanvas';
		ctx = canvas.getContext '2d';

		$(@el).find('a.upload-field').click (e)->
			e.preventDefault();
			$('#imageLoader').click();
			return false;
		$(@el).find('a.submit').click (e)->
			e.preventDefault();
			$form = $('#item-new-form');
			if !_this.imageData?
				alert 'No image data'
				return false;
			if $form.find('[name="title"]').val() == ''
				alert 'Put a title'
				return false;
			if $form.find('[name="description"]').val() == ''
				alert 'Put a description'
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
		$.post @url, jsonBody, (data)->
			if data.code != 200
				alert data.error
			else
				App.router.navigate '/items/' + data.response.id, 
					trigger:true
