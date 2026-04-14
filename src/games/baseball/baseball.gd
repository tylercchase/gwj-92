class_name Baseball
extends RigidBody3D

var local_collision_pos

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _integrate_forces( state ):
	if state.get_contact_count() >= 1:
		local_collision_pos = state.get_contact_local_position(0)

func _on_body_entered(body):
	if local_collision_pos:
		var collision_position: Vector3 = local_collision_pos - global_position
		apply_impulse(collision_position.abs() * Vector3(1,1,-40), collision_position) # TODO: figure out bat velocity better so faster swings go farther
		# TODO: need to remove self either when missed or after hitting something else/time period after hit = home run
		
