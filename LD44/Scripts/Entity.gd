extends KinematicBody2D

var entTYPE = "Enemy"
var SPEED = 0
var DAMAGE = 1
var IMMUNE = false
var MAXHEALTH = 16

var MovDir = Vector2(0,0)
var KnockDir = Vector2(0,0)
var SpriteDir = "Right"

var hitstun = 0
var health = 2

const ent_orb = preload("res://Entities/ent_orb/ent_orb.tscn")

#States
var isAttacking = false

func movement_loop(SPEED):
	var motion
	if hitstun == 0:
		motion = MovDir.normalized() * SPEED
	else:
		motion = KnockDir.normalized() * 125
	move_and_slide(motion, Vector2(0,0))
  
func spritedir_loop():
	match MovDir:
		Vector2(-1,0):
			SpriteDir = "Left"
		Vector2(1,0):
			SpriteDir = "Right"
		Vector2(0,-1):
			SpriteDir = "Left" #"Up"
		Vector2(0,1):
			SpriteDir = "Right" #"Down"

func anim_switch(animation):
	var newAnim = str(animation,SpriteDir)
	if $Sprite/anim_player.current_animation != newAnim:
		$Sprite/anim_player.play(newAnim)

func damage_loop():
	if hitstun > 0:
		hitstun -= 1
	else:
		if entTYPE == "Enemy" && health <= 0:
			queue_free()
	for area in $hitbox.get_overlapping_areas():
		var body = area.get_parent()
		if hitstun == 0 and body.get("DAMAGE") != null and body.get("entTYPE") != entTYPE and IMMUNE == false:
			health -= body.get("DAMAGE")
			hitstun = 10
			KnockDir = global_transform.origin - body.global_transform.origin

func use_item(item):
	var newItem = item.instance()
	newItem.add_to_group(str(newItem.get_name(), self))
	add_child(newItem)
	if get_tree().get_nodes_in_group(str(newItem.get_name(), self)).size() >newItem.maxamount:
		newItem.queue_free()

func fireProc():
	health = health - 1
	var proc = ent_orb.instance()
	proc.global_position = global_position
	get_parent().add_child(proc)
	