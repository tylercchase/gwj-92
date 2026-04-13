extends Control

@export var buttons: Control
@export var selection_buttons: Control
@export var menu_button: Button
@export var start_button: Button

@export var base_home_screen: Control
@export var selection_screen: Control

@export var cursor: Cursor
var current_target: String = ""

func _ready() -> void:
	for button in buttons.get_children():
		if button is BaseButton:
			button.pressed.connect(_on_button_pressed.bind(button))
	start_button.pressed.connect(_on_start_button)
	menu_button.pressed.connect(_on_menu_button)
	selection_screen.visible = false

func _on_button_pressed(button):
	if button is SceneButton:
		current_target = button.target_scene_path
	var tween = create_tween()
	tween.parallel().tween_property(base_home_screen, "modulate", Color.BLACK, 0.3)
	selection_screen.position = button.position
	selection_screen.scale = Vector2.ZERO
	selection_screen.visible = true
	tween.parallel().tween_property(selection_screen, "scale", Vector2.ONE, 0.4)
	tween.parallel().tween_property(selection_screen, "position", Vector2.ZERO, 0.4)
	cursor.buttons = selection_buttons
	
	

func _on_start_button():
	if len(current_target) > 0:
		Events.emit_scene_changed(current_target)

func _on_menu_button():
	current_target = ""
	base_home_screen.modulate = Color.WHITE
	selection_screen.visible = false
	cursor.buttons = buttons
	
