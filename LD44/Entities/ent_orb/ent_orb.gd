extends Sprite

const procSpeed = 600

var target
var velocity = Vector2()
var SpriteDir = "Right"

var entTYPE = "player"
var puzzTYPE = "orb"
var IMMUNE = false
var DAMAGE = 1

func _ready():
	target = get_global_mouse_position()
	velocity = -(position - target).normalized()
	var vecc = Vector2(floor(velocity.x),floor(velocity.y))
	#print(velocity)
	#print(vecc)
	pass
	
func _process(delta):
	position += velocity
	spritedir_loop()
	anim_switch("proc")

func spritedir_loop():
	
	var velocityFixed = Vector2(floor(velocity.x),floor(velocity.y))
	
	match velocityFixed:
		Vector2(0,0):
			SpriteDir = "Down"#
		Vector2(0,-1):
			SpriteDir = "Right"#
		Vector2(-1,0):
			SpriteDir = "Left"#
		Vector2(-1,-1):
			SpriteDir = "Up"#

func anim_switch(animation):
	var newAnim = str(animation,SpriteDir)
	if $anim_player.current_animation != newAnim:
		$anim_player.play(newAnim)

