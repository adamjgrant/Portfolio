define ['./timeline.min', './timeline_light.css!', './timeline.css!', 'ks:ang-app/controllers/projects'], (Timeline) ->
	console.log Timeline
	# For the timeline plugin
	timeline = new Timeline($('#timeline'), k$.projects)
	timeline.display()