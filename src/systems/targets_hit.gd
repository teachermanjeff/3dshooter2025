extends Label

func _ready():
	State.on_hit.connect(on_hit)
	
func on_hit(value):
	text = "🎯target hit: {0}".format([value])
