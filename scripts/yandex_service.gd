extends Node
class_name YandexService

static var callback_rewarded_ad = JavaScriptBridge.create_callback(_rewarded_ad)
static var callback_ad = JavaScriptBridge.create_callback(_ad)
static var win

@onready var splash_ad: Control = $"../SplashAd"

static var instance: YandexService = null

func _ready() -> void:
	win = JavaScriptBridge.get_interface("window")
	instance = self
	while(true):
		await get_tree().create_timer(150).timeout
		js_show_ad()

static func js_show_ad():
	instance.splash_ad.visible = true
	instance.get_tree().paused = true
	await instance.get_tree().create_timer(3).timeout
	if(win != null):
		win.ShowAd(callback_ad)
	instance.splash_ad.visible = false
	await instance.get_tree().create_timer(3).timeout
	instance.get_tree().paused = false

static func js_show_rewarded_ad():
	instance.get_tree().paused = true
	win.ShowAdRewardedVideo(callback_rewarded_ad)
	await instance.get_tree().create_timer(20).timeout
	instance.get_tree().paused = false
	
static func _rewarded_ad(args):
	instance.get_tree().paused = false
	var bonusMoney = min(UserService.instance.money, 100000) * 2
	UserService.instance.money += bonusMoney

static func _ad(args):
	instance.get_tree().paused = false

