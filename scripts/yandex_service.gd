extends Node

static var callback_rewarded_ad = JavaScriptBridge.create_callback(_rewarded_ad)
static var callback_ad = JavaScriptBridge.create_callback(_ad)
static var win

func _ready() -> void:
	win = JavaScriptBridge.get_interface("window")

static func js_show_ad():
	win.ShowAd(callback_ad)

static func js_show_rewarded_ad():
	win.ShowAdRewardedVideo(callback_rewarded_ad)
	
static func _rewarded_ad(args):
	print(args[0])

static func _ad(args):
	print(args[0])

