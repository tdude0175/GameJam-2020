extends Area2D

var labelText = ["I demand you fix my weapons!","Get to work!","Hrumph"]
var currentText = 0

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			$Label.visible = true
			$Label.text = labelText[currentText]
			if Input.is_action_just_pressed("ui_accept"):
				currentText+=1
	if (!get_overlapping_bodies()):
		$Label.visible = false
		currentText = 0