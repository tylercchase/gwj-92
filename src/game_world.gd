extends SubViewport

@export var test_scene: PackedScene
@export var tv_mesh: MeshInstance3D

func _ready() -> void:
	var test = test_scene.instantiate()
	add_child(test)
	test.position = Vector3(1000, 0, 1000)
