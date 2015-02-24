App.Schemas.Animal =
	name:
		type: String
		optional: true
	age:
		type: String
		optional: true
	breed:
		type: String
		optional: true
	sex:
		type: String
		optional: true
	size:
		type: String
		optional: true
	centre:
		type: String
		optional: true
	childSuitability:
		type: String
		optional: true
	liveWithDogs:
		type: String
		optional: true
	idealLocation:
		type: String
		optional: true
	liveWithCats:
		type: String
		optional: true
	reference:
		type: String
		optional: true
	description:
		type: String
		optional: true
	images:
		type: [String]
		optional: true

App.Animals = new Mongo.Collection "animals"

App.Animals.attachSchema App.Schemas.Animal