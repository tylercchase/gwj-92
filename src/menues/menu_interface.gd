extends Node

var real_remote: RealRemote


func _ready():
    real_remote = get_tree().get_first_node_in_group("real_remote")
    if real_remote:
        real_remote.raycast_hit.connect(_on_raycast_hit)


func _on_raycast_hit(hit):
    pass
