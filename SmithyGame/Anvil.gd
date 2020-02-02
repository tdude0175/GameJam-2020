#Anvil Game Start
extends Area2D

func _process(delta):
	if(get_overlapping_bodies()):
		
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if body.name == "Player":
				$Prompt.visible = true
				if Input.is_action_just_pressed("ui_accept"):
					print("Work is never Done")
	else:
		$Prompt.visible = false