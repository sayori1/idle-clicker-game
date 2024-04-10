extends Node
class_name UserService

signal update
signal new_level

static var instance: UserService

var clickAmount = 1:
	set(v):
		clickAmount = v
		update.emit()
		
var autoClickAmount = 0:
	set(v):
		autoClickAmount = v
		update.emit()

var level = 0:
	set(v):
		level = v
		update.emit()

var touches = 0:
	set(v):
		touches = v
		update.emit()
		xp = touches
		check_level_up()

var xp = 0.0:
	set(v):
		xp = v
		update.emit()
		
var xp_progress:
	get:
		var v = float(xp - xp_needed_for_current_level) / float(xp_needed_for_next_level  - xp_needed_for_current_level) * 100.0
		return v

var money = 0:
	set(v):
		money = v
		update.emit()
		

var lastOpenedShop = 2

func _ready() -> void:
	instance = self
	while(true):
		await get_tree().create_timer(0.25).timeout
		UserService.instance.money += autoClickAmount * 0.25
		
var xp_needed_for_next_level = 10
var xp_needed_for_current_level = 0

func check_level_up():
	while xp >= xp_needed_for_next_level:
		xp -= xp_needed_for_next_level
		level += 1
		new_level.emit()
		xp_needed_for_current_level = xp_needed_for_next_level
		xp_needed_for_next_level = calculate_xp_for_next_level(level)

func calculate_xp_for_next_level(level: int) -> int:
	return int(10 * pow(4, level - 1))

func save_data():
	pass
