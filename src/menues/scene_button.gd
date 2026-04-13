class_name SceneButton
extends TextureButton

@export_file("*.tscn") var target_scene_path: String

func _ready() -> void:
	pressed.connect(_pressed)

func _pressed():
	Events.emit_scene_changed(target_scene_path)
