extends TextureRect

const ICON_SOUND_ON = preload("res://images/ExportedIcons/Icon_SoundOn.png")
const ICON_SOUND_OFF = preload("res://images/ExportedIcons/Icon_SoundOff.png")

var playing = true:
	set(v):
		playing = v
		if(playing):
			texture = ICON_SOUND_ON
			AudioServer.set_bus_mute(0, false)
		else:
			texture = ICON_SOUND_OFF
			AudioServer.set_bus_mute(0, true)

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gui_input(event: InputEvent) -> void:
	if(event is InputEventMouseButton):
		if(event.is_pressed() && !event.is_echo()):
			playing = !playing
