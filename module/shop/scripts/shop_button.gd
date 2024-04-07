@tool
extends Panel

@onready var name_label: RichTextLabel = $M/H/V/Label
@onready var desc_label: Label = $M/H/V/Label2
@onready var icon_rect: TextureRect = $M/V2/TextureRect
@onready var price_label: Label = $M/V2/HBoxContainer/ScoreLabel

@export var icon_modulate: Color = Color.WHITE:
	set(v):
		icon_modulate = v
		if(icon_rect == null): return
		icon_rect.modulate = icon_modulate
@export var enabled: bool = false:
	set(v):
		enabled = v
		modulate =  Color.WHITE if enabled else Color.GRAY
@export var icon: Texture2D:
	set(v):
		icon = v
		if(icon_rect == null): return
		icon_rect.texture = icon
@export var Name: String:
	set(v):
		Name = v
		if(name_label == null): return
		name_label.text = Name
@export var description: String:
	set(v):
		description = v
		if(desc_label == null): return
		desc_label.text = v
@export var price: int = 0:
	set(v):
		price = v
		if(price_label == null): return
		price_label.text = str(Utils.beautify_number(v))

@export var autoClickBonus: int = 0;
@export var clickBonus: int = 0;
@export var autoFillDescription: bool = false:
	set(v):
		autoFillDescription = v
		if(v):
			if(autoClickBonus != 0):
				description = "+%s каждую сек." % Utils.beautify_number(autoClickBonus)
			else:
				description = "+%s при клике." % Utils.beautify_number(clickBonus)

func _enter_tree() -> void:
	if !Engine.is_editor_hint(): return 
	refreshUI()

func _ready() -> void:
	UserService.instance.update.connect(refresh)
	refreshUI()
	
func refresh():
	enabled = UserService.instance.money >= price
	
func refreshUI():
	name_label.text = Name
	desc_label.text = description
	icon_rect.texture = icon
	price = price
	autoFillDescription = autoFillDescription
	icon_rect.modulate = icon_modulate

func _on_gui_input(event: InputEvent) -> void:
	if(event is InputEventMouseButton):
		if(!event.is_echo() && event.is_pressed()):
			onTap()
			
func onTap():
	if(UserService.instance.money >= price):
		UserService.instance.money -= price
		UserService.instance.autoClickAmount += autoClickBonus
		UserService.instance.clickAmount += clickBonus
		
		AudioPlayer.instance.playPurchase()
		
