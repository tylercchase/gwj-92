class_name Bat
extends CharacterBody3D

@export var movement_sync: RemoteSync
var tracked_positions : Array[Vector3] = []

func _ready() -> void:
	movement_sync.position_changed.connect(_on_remote_moved)

func _physics_process(delta: float) -> void:
	tracked_positions.push_front(position)
	if len(tracked_positions) > 50:
		tracked_positions.pop_back()


func calculate_movement_over_time() -> Vector3:
	return Vector3.ZERO

func _on_remote_moved(delta: Vector3) -> void:
	position += Vector3(delta.z, delta.y, delta.x)
	print(delta)