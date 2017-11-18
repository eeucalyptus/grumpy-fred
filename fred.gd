extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var is_at_ladder = false
var is_at_ladder_bottom = false
var is_at_goat = false

func _ready():
	self.set_process(true)
	
func _process(delta):
	if(not is_at_ladder):
		pullDown(delta)
	
	if (Input.is_action_pressed("WALK_RIGHT")):
		walkRight(delta)
	elif (Input.is_action_pressed("WALK_LEFT")):
		walkLeft(delta)
	elif (Input.is_action_pressed("CLIMB_DOWN")):
		climbDown(delta)
	elif (Input.is_action_pressed("CLIMB_UP")):
		climbUp(delta)
	else:
		if(Input.is_action_pressed("INTERACT") and is_at_goat):
			get_node("AnimatedSprite").set_animation("knife_up")
		else:
			if(is_at_ladder):
				get_node("AnimatedSprite").set_animation("climb_stay")
			else:
				get_node("AnimatedSprite").set_animation("default")


func walkLeft(delta):
	if(not is_at_ladder or is_at_ladder_bottom):
		get_node("AnimatedSprite").set_animation("walk_left")
		move(Vector2(-30*delta, 0))
	
func walkRight(delta):
	if(not is_at_ladder or is_at_ladder_bottom):
		get_node("AnimatedSprite").set_animation("walk_right")
		move(Vector2(30*delta, 0))
	
func climbUp(delta):
	if(is_at_ladder):
		get_node("AnimatedSprite").set_animation("climb_up")
		move(Vector2(0,-100*delta))
	
func climbDown(delta):
	if(is_at_ladder):
		get_node("AnimatedSprite").set_animation("climb_down")
		move(Vector2(0,100*delta))
	
func pullDown(delta):
	move(Vector2(0, 100*delta))

func _on_Area2D_area_enter( area ):
	if (area==get_parent().get_node("Ladder")):
		is_at_ladder = true
		print("At ladder")
	if(area==get_parent().get_node("LadderBottom")):
		print("At ladder bottom")
		is_at_ladder_bottom = true
	if(area==get_parent().get_node("Goat/area")):
		is_at_goat = true
		print("At goat")


func _on_Area2D_area_exit( area ):
	if (area==get_parent().get_node("Ladder")):
		is_at_ladder = false
		print("Away from ladder")
	if(area==get_parent().get_node("LadderBottom")):
		is_at_ladder_bottom = false
		print("Away from ladder bottom")
	if(area==get_parent().get_node("Goat/area")):
		is_at_goat = false
		print("Away from goat")
	
