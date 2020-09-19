extends KinematicBody2D

const UP := Vector2.UP

export (int) var gravity := 98
export (float) var acceleration := 0.5
export (int) var max_speed := 1000
export (int) var jump_speed := 2000
export (float) var friction := 0.8


var velocity := Vector2()
var on_floor := false
var jumps := 2
onready var jumps_available := jumps

func _physics_process(delta):
	var direction_x := int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	velocity.x = lerp(velocity.x, direction_x * max_speed, acceleration)
	if direction_x == 0:
		velocity.x = lerp(velocity.x, 0, friction)
	
	velocity = move_and_slide(velocity, UP)
	
	
	if is_on_floor():
		if on_floor == false:
			on_floor = true
			jumps_available = jumps
	else:
		if on_floor == true:
			on_floor = false
			jumps_available = 1
		velocity.y += gravity


func _unhandled_input(event):
	if Input.is_action_just_pressed("jump"):
		jump()
	if Input.is_action_just_released("jump"):
		jump_cut()
	


func jump():
	print(jumps_available)
	if jumps_available > 0:
		velocity.y = -jump_speed
		jumps_available -= 1

func jump_cut():
	if velocity.y < -100:
		velocity.y = -100
