extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var time_elapsed = 0.0

func _ready():
	set_process(true)
	
func _process(delta):
	time_elapsed += delta
	
	if(time_elapsed < 0.1):
		set_modulate(Color(1,1,1,0.5))
	if(time_elapsed > 0.1):
		set_modulate(Color(1,1,1,0.8))
	
	if(time_elapsed > 0.2):
		time_elapsed = 0.0
