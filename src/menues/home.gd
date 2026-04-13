extends Control

@export var buttons: Control
@export var selection_button: Control
@export var menu_button: Button
@export var start_button: Button
@export var animations: AnimationPlayer

var current_target: String = ""

func _ready() -> void:
	for button in buttons.get_children():
		if button is Button:
			button.pressed.connect(_on_button_pressed.bind(button))
	start_button.pressed.connect(_on_start_button)
	menu_button.pressed.connect(_on_menu_button)

func _on_button_pressed(button):
	if button is SceneButton:
		current_target = button.target_scene_path
		print(button)

func _on_start_button():
	if len(current_target) > 0:
		Events.emit_selected_scene(current_target)

func _on_menu_button():
	current_target = ""
