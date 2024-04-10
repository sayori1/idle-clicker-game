extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	pass

func splash():
	animation_player.play("splash")
