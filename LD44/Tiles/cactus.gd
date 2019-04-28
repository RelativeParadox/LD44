extends Node2D


var entTYPE = "Enemy"
var DAMAGE = 1
var IMMUNE = false
var health = 1




func _ready():
	pass # Replace with function body.

func _process(delta):
	
	if entTYPE == "Enemy" && health <= 0:
		queue_free()
	
	for area in $hitbox.get_overlapping_areas():
		var body = area.get_parent()
		if body.get("DAMAGE") != null and body.get("entTYPE") != entTYPE and IMMUNE == false:
			health -= body.get("DAMAGE")
	