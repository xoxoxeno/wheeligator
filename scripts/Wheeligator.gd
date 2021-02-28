extends KinematicBody2D

var tires = 0

var slow_speed = 100
var fast_speed = 300
var slow_rotation_speed = 1.5
var fast_rotation_speed = 5

var velocity = Vector2.ZERO
var rotation_dir = 0


func _physics_process(delta):

	debug_controls()
	if tires > 3:
		tires = 0

	get_input_basic()
	get_input_tires()
	
	match tires:
		0:
			rotation += rotation_dir * slow_rotation_speed * delta
		1:
			pass
		2:
			rotation += rotation_dir * fast_rotation_speed * delta
		3:
			pass

	velocity = move_and_slide(velocity)

func debug_controls():

	if Input.is_action_just_pressed("debug_add_tire"):
		tires += 1

func get_input_basic():

	rotation_dir = 0
	velocity = Vector2.ZERO

	if Input.is_action_pressed("gator_right"):
		rotation_dir += 1
	if Input.is_action_pressed("gator_left"):
		rotation_dir -= 1
	if Input.is_action_pressed("gator_back"):
		velocity -= transform.x * slow_speed
	if Input.is_action_pressed("gator_forward"):
		velocity += transform.x * fast_speed

func get_input_tires():
	pass
