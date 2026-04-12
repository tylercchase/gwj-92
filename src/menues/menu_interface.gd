class_name MenuInterfaceComponent
extends Node

var real_remote: RealRemote
var tv_screen: MeshInstance3D

const VIEWPORT_SIZE := Vector2(600, 480)
const MESH_SIZE := Vector2(1.65, 1.32)

signal remote_moved

func _ready():
	real_remote = get_tree().get_first_node_in_group("real_remote")
	if real_remote:
		real_remote.raycast_hit.connect(_on_raycast_hit)
	tv_screen = get_tree().get_first_node_in_group("TV")


func _on_raycast_hit(hit: Vector3):
	var uv := Vector2(
		(hit.x + MESH_SIZE.x / 2.0) / MESH_SIZE.x,
		(MESH_SIZE.y / 2.0 - hit.y) / MESH_SIZE.y + 1.0
	) # idk this is just a bunch of weird numbers plugged in hoping it works
	remote_moved.emit(uv * VIEWPORT_SIZE)
