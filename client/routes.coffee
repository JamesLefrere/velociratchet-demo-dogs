Router.configure
	layoutTemplate: "layout"
	vratchet:
		title: "My App"
		nav: true
		tabs: [
			{
				route: "index"
				icon: "home"
				label: "Dogs"
			}
		]

class PopoverController extends RouteController
	vratchet:
		region: "popover"
		backRoute: "index"
	action: ->
		template = @route.options.template or @route.getName()
		backRoute = @route.options.vratchet.backRoute or @route.options.route.options.controller.vratchet.backRoute
		@render backRoute
		@render template, to: "popover"
		$("body").addClass("has-popover")
		# i.e. if this is the first route we open, there are no animations
		if Velociratchet.history.get().length is 0
			Meteor.defer ->
				$(".popover").css(display: "block", opacity: "1")
		return
	onStop: ->
		$("body").removeClass("has-popover")
		return

class ModalController extends RouteController
	vratchet:
		region: "modal"
		backRoute: "index"
	action: ->
		template = @route.options.template or @route.getName()
		backRoute = @route.options.vratchet.backRoute or @route.options.route.options.controller.vratchet.backRoute
		@render backRoute
		@render template, to: "modal"
		# i.e. if this is the first route we open, there are no animations
		if Velociratchet.history.get().length is 0
			Meteor.defer ->
				$(".modal").css(opacity: 1, transform: "translate3d(0, 0%, 0)")
		return

Router.route "index",
	path: "/"
	vratchet:
		title: "Dogs"
		navRight:
			icon: "plus"
			route: "addDog"

Router.route "addDog",
	path: "add-dog"
	controller: PopoverController
	# controller: ModalController
	vratchet:
		backRoute: "index"
		title: "Add dog"

Router.route "dog",
	path: "dog/:_id"
	vratchet:
		backRoute: "index"
	data: ->
		dog = App.Animals.find(@params._id).fetch()[0]
		if dog
			@route.options.vratchet.title = dog.name
			dog: dog
