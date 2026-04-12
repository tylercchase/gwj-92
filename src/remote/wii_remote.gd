class_name RealRemote
extends MeshInstance3D


@onready var base_position = Vector3(position)

@export var clamp_values = Vector2(0.2, 0.2)
@export var movement_scale = 0.01

signal raycast_hit
signal moved

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	var delta = Vector3.ZERO
	if event is InputEventMouseMotion:
		delta.x = clamp(position.x + event.relative.x * movement_scale, base_position.x - clamp_values.x, base_position.y - clamp_values.y) - position.x

	moved.emit(delta)
	position += delta
