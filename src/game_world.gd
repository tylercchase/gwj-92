extends SubViewport

@export var test_scene: PackedScene
@export var tv_mesh: MeshInstance3D

func _ready() -> void:
	Events.scene_changed.connect(_on_scene_change)


func _on_scene_change(path):
	# some kinda animation between transition theoretically. but for now just switchover
	for child in get_children():
		child.queue_free()
	var loaded_scene = load(path)
	var temp = loaded_scene.instantiate()
	add_child(temp)
	temp.global_position = Vector3(100, 0, 100)
