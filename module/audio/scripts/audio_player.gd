extends AudioStreamPlayer2D
class_name AudioPlayer

const SHOP = preload("res://module/shop/audio/shop.wav")

static var instance: AudioPlayer

func _ready() -> void:
	instance = self

func playPurchase():
	stream = SHOP
	play()
