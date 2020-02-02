extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 160
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	#hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var velocity = Vector2()
	velocity.y += 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$Sprite.flip_h = true
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$Sprite.flip_h = false
	velocity = move_and_slide(velocity)
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		#$AnimatedSprite.play()
	#else:
		#$AnimatedSprite.stop()
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	#if velocity.x != 0:
	#	$AnimatedSprite.animation = "Right"
	#	$AnimatedSprite.flip_v = false
	#	$AnimatedSprite.flip_h = velocity.x < 0
	#elif velocity.y != 0:
	#	$AnimatedSprite.animation = "Up"
	#	$AnimatedSprite.flip_v = velocity.y > 0
	pass
