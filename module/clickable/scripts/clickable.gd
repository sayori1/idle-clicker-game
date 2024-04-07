extends TextureRect
class_name Clickable

signal touch

@onready var player: AnimationPlayer = $Player
@onready var touch_sound: AudioStreamPlayer2D = $TouchSound
const SCORE_POINT = preload("res://module/clickable/prefabs/score_point.tscn")
@onready var score_label: Label = $"../../VBoxContainer/VBoxContainer/ScoreLabel"
const SHOT = preload("res://module/clickable/prefabs/shot.tscn")

var center: Vector2:
	get:
		var center = get_global_rect().get_center()
		return center
		


func _gui_input(event: InputEvent) -> void:
	if(event is InputEventMouseButton):
		if(!event.is_echo() && event.is_pressed()):
			touch.emit()
			onTouch()
			
func onTouch():
	player.play('touch')
	touch_sound.play()
	
	UserService.instance.touches += 1
	UserService.instance.money += UserService.instance.clickAmount
	

	
	score_label.value = UserService.instance.money
	
	var scorePoint = SCORE_POINT.instantiate()
	scorePoint.text = '+%s' % Utils.beautify_number(UserService.instance.clickAmount)
	
	scorePoint.global_position = global_position
	scorePoint.global_position.x += randf_range(0, get_rect().size.x )
	scorePoint.global_position.y += randf_range(-50, 50)
	
	var shot = SHOT.instantiate()
	add_child(shot)
	shot.global_position = get_global_mouse_position()
	shot.emitting = true;
	
	get_tree().current_scene.add_child(scorePoint)
