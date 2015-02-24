Template.index.helpers
	animals: ->
		App.Animals.find({}, limit: 25)
	firstImage: ->
		@images?[0]