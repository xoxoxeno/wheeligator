extends KinematicBody2D

var tires = 0

var slow_speed = 100
var fast_speed = 300
var rotation_speed = 1.5

var velocity = Vector2.ZERO
var rotation_dir = 0
var alt_rotation_dir = 0

onready var pivot = get_parent() 

func _physics_process(delta):



	debug_controls()
	if tires > 3:
		tires = 0

	get_input_gator()
	get_input_tires()
	
	rotation += rotation_dir * rotation_speed * delta


	
	velocity = move_and_slide(velocity)




func get_input_gator():

	rotation_dir = 0
	alt_rotation_dir = 0
	velocity = Vector2.ZERO


	if Input.is_action_pressed("gator_left"):
		rotation_dir -= 1
	if Input.is_action_pressed("gator_right"):
		rotation_dir += 1
	if Input.is_action_pressed("gator_back"):
		velocity += transform.y * slow_speed
	if Input.is_action_pressed("gator_forward"):
		velocity -= transform.y * fast_speed

func get_input_tires():
	
	match tires:
		0:
			pass
		1:
			if Input.is_action_pressed("tire_left"):
				velocity -= transform.x * slow_speed
			if Input.is_action_pressed("tire_right"):
				velocity += transform.x * slow_speed
		2:
			if Input.is_action_pressed("tire_left"):
				rotation_dir -= 4
			if Input.is_action_pressed("tire_right"):
				rotation_dir += 4
		3:
			if Input.is_action_pressed("tire_left"):
				velocity -= transform.x * fast_speed
			if Input.is_action_pressed("tire_right"):
				velocity += transform.x * fast_speed

func debug_controls():

	if Input.is_action_just_pressed("debug_add_tire"):
		tires += 1
