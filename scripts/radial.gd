extends TextureRect

var time = 0
@export var anchor: Clickable

func _process(delta: float) -> void:
	time += delta
	var alpha = abs(sin(time * 0.2))
	modulate.a = alpha
	
	var _scale = alpha * 0.5
	
	scale.x = _scale
	scale.y = _scale
	
	rotation += delta
