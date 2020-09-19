extends KinematicBody2D

const UP := Vector2.UP

const ACCELERATION := 50
const MAX_SPEED := 100
const GRAVITY := 98
const JUMP_SPEED := 200


var velocity := Vector2()
var direction := Vector2()

func _physics_process(delta):
	direction.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	
	
	
	
	velocity = (direction * MAX_SPEED) * delta
	print(velocity)
	
	velocity = move_and_slide(velocity * MAX_SPEED, UP)
