extends Sprite

var puzzTYPE = "orb"
var wasHit = false

func _ready():
	pass 
	

func _process(delta):
	if wasHit == false:
		for area in $hitbox.get_overlapping_areas():
			var body = area.get_parent()
			if body.get("puzzTYPE") == puzzTYPE:
				print("does something")
				wasHit = true
		if $anim_player.current_animation != "unlit":
					$anim_player.play("unlit")
		if $ent_altar_bottom/anim_player.current_animation != "unlit":
					$ent_altar_bottom/anim_player.play("unlit")
	else:
		if $anim_player.current_animation != "lit":
			$anim_player.play("lit")
		if $ent_altar_bottom/anim_player.current_animation != "lit":
			$ent_altar_bottom/anim_player.play("lit")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
