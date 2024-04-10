extends TextureRect

func _ready() -> void:
	$AnimationPlayer.play("default")


func _on_gui_input(event: InputEvent) -> void:
	if(event is InputEventMouseButton):
		if(event.is_pressed() && !event.is_echo()):
			YandexService.instance.js_show_rewarded_ad()
