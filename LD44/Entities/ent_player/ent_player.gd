extends "res://Scripts/Entity.gd"



func _init():
	SPEED = 70
	entTYPE = "player"
	DAMAGE = 1
	IMMUNE = false
	health = 8

var state = "normal"

func _physics_process(delta):
	match state:
		"normal":
			stateNormal()
		"attacking":
			stateAttacking()

func stateNormal():
	IMMUNE = false
	control_loop()
	movement_loop(SPEED) #Speed was 70 or 90
	damage_loop()
	spritedir_loop()
	
	#if is_on_wall():
	#	if SpriteDir == "Left" and test_move(transform, Vector2(-1,0)):
	#		anim_switch("run") #"push"
	#	if SpriteDir == "Right" and test_move(transform, Vector2(1,0)):
	#		anim_switch("run") #"push"
	#	if SpriteDir == "Up" and test_move(transform, Vector2(0,-1)):
	#		anim_switch("run") #"push"
	#	if SpriteDir == "Down" and test_move(transform, Vector2(0,1)):
	#		anim_switch("run") #"push"
	#el
	if MovDir != Vector2(0,0):
		anim_switch("run")
	else:
		anim_switch("idle")
		

func stateAttacking():
	IMMUNE = true
	control_loop()
	damage_loop()
	spritedir_loop()
	anim_switch("attack")
	MovDir = Vector2(0,0)

func control_loop():
	var Left = Input.is_action_pressed("ui_left")
	var Right = Input.is_action_pressed("ui_right")
	var Up = Input.is_action_pressed("ui_down")
	var Down = Input.is_action_pressed("ui_up")
	
	var Attack = Input.is_action_pressed("mouse_left")
	if Attack == true:
		state = "attacking"
	else:
		state = "normal"
	
	var Shoot = Input.is_action_just_pressed("mouse_right")
	if Shoot == true:
		fireProc()
	else:
		pass
	
	MovDir.x = -int(Left) + int(Right)
	MovDir.y = -int(Down) + int(Up)

func _ready():
	pass 
