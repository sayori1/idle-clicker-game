extends Clickable

var time = 0

const _0 = preload("res://module/clickable/images/evolution/0.png")
const _1 = preload("res://module/clickable/images/evolution/1.png")
const _2 = preload("res://module/clickable/images/evolution/2.png")
const _3 = preload("res://module/clickable/images/evolution/3.png")
const _4 = preload("res://module/clickable/images/evolution/4.png")


func _ready() -> void:
	UserService.instance.new_level.connect(newLevel)

func _process(delta: float) -> void:
	time += delta
	var alpha = sin(time)
	rotation = alpha * 0.1

func onTouch():
	super.onTouch()
	
func newLevel():
	var level = UserService.instance.level
	if(level < 1):
		texture = _0
		scale = Vector2(0.8,0.8)
	elif(level < 5):
		texture = _1
		scale = Vector2(1,1)
	elif(level < 7):
		texture = _2
		scale = Vector2(1.2,1.2)
	elif(level < 10):
		scale = Vector2(1.5,1.5)
		texture = _3
	elif(level < 12):
		scale = Vector2(5,5)
		texture = _4
