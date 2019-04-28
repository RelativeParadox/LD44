extends "res://Scripts/Entity.gd"

func _init():
	SPEED = 30 #Was 40
	entTYPE = "Enemy"

var movetimer_length = 60
var movetimer = 0

func _ready():
	MovDir = util.randD()

func control_loop():
	if movetimer > 0:
		movetimer -= 1
	elif movetimer == 0 || is_on_wall():
		MovDir = util.randD()
		movetimer = movetimer_length
		

func _physics_process(delta):
	control_loop()
	movement_loop(SPEED)
	damage_loop()
	spritedir_loop()
	
	if MovDir != Vector2(0,0):
		anim_switch("slide")
	else:
		anim_switch("stand")
	
