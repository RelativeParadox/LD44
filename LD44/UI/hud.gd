extends CanvasLayer

onready var player = get_node("../player")
onready var hearts = get_node("hearts")

var HEART_ROW_SIZE = 8
var HEART_OFFSET = 8

func _ready():
	print("wait")


func _process(delta):
	var currenthealth = int(player.health)
	if currenthealth > 0:
		var healthframe = 16 - currenthealth
		hearts.frame = healthframe
