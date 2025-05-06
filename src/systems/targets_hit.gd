extends Label

func _ready():
	State.on_hit.connect(on_hit)
	
func on_hit(value):
	text = "🎯targets hit: {0}".format([value])
