extends Camera2D

func _ready():
	set_process(true)

func _process(delta): #Subtracts the Hud Displacement, currently 0
	var pos = get_node("../player").global_position
	var x = floor(pos.x / 320) * 320
	var y = floor(pos.y / 288) * 288
	global_position = Vector2(x,y)
