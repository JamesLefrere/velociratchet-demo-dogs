# velociratchet-demo-dogs

Demonstrating possible development of the meteor velociratchet package

Demo: http://velociratchet-dogs.meteor.com/

Have a look at https://github.com/JamesLefrere/velociratchet-meteor-package (forked from https://github.com/zendylabs/velociratchet-demo)

The idea of this little demo is to keep a lot of the complexity inside the layout template and set some of the basic attributes of the pages in the router/controllers/routes. 

e.g. 

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
		vratchet:
			backRoute: "index"
			title: "Add dog"
			
I'd be very interested in seeing if this package can become a lightweight, easy alternative to some of the other mobile front-end solutions for Meteor; with tight integration to iron router and some nice velocity animations, it could work! 
