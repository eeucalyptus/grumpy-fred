extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	self.set_process(true)
	
func _process(delta):
	if (Input.is_action_pressed("CLIMB_DOWN")):
		move(Vector2(0,100*delta))
	if (Input.is_action_pressed("CLIMB_UP")):
		move(Vector2(0,-100*delta))
	if (Input.is_action_pressed("WALK_LEFT")):
		move(Vector2(100*delta, 0))
	if (Input.is_action_pressed("WALK_RIGHT")):
		move(Vector2(100*delta, 0))


func walkLeft():
	