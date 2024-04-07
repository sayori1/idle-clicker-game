extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	UserService.instance.new_level.connect(splash)

func splash():
	animation_player.play("splash")
