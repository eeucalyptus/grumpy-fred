extends Container

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	self.set_process(true)
	
func _process(delta):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		var cur_pos = self.get_pos()
		cur_pos.x += 100 * delta
		
		# wrap around screen
		if(cur_pos.x > self.get_viewport_rect().size.width + self.get_item_rect().size.width/2):
			cur_pos.x = -self.get_item_rect().size.width/2
		self.set_pos(cur_pos)
		
func setMode():
	pass