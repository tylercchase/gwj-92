extends Node

var real_remote: RealRemote


func _ready():
	real_remote = get_tree().get_first_node_in_group("real_remote")
	real_remote.moved.connect(_on_remote_moved)


func _on_remote_moved(delta: Vector3):
	get_parent().position += delta
