extends Node3D

@export var baseball_scene: PackedScene

var timer: Timer

func _ready() -> void:
	timer = Timer.new()
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	timer.start(1.75)


func _on_timer_timeout():
	spawn_baseball()

func spawn_baseball():
	var baseball: Baseball = baseball_scene.instantiate()
	add_child(baseball)
	baseball.global_position = global_position
	baseball.apply_impulse(Vector3(0,0,1.0) * 25, Vector3.ZERO) # maybe in the future define paths instead of using physics?
	# would let us define more explicitly how fast moving through pitches
