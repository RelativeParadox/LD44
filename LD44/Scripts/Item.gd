extends Node2D

var TYPE = null
var DAMAGE = 1
var maxamount = 1

# $anim is the animation player on item

func _ready():
	TYPE = get_parent().TYPE
	$anim.connect("animation_finished",self,"destroy")
	$anim.play(str("swing",get_parent().spritedir))
	# Method for getting and makeing state changes
	if get_parent().has_method("stateAttacking"):
		get_parent().state = "swing"
	
func destroy(animation):
	#Resets state when deleted
	if get_parent().has_method("stateAttacking"):
		get_parent().state = "normal"
	queue_free()


### USE ###
# For use with Buttion in player script:
###########
# if Input.is_action_just_pressed("buttion"):
## use_item(preload("res://items/item.tscn)) 
#
#spawns "item.tscn" when "buttion" is pressed
#
#Item Object Setup
#Item
##anim
##sprite
##area
###CollisionShape2D