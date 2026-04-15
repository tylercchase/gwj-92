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
		if body is Bat:
			var bat_velocity: Vector3 = body.calculate_movement_over_time()
			var speed: float = bat_velocity.length()

			var impulse: Vector3 = bat_velocity * (speed * 300.0)
			impulse.z = abs(impulse.z) * -1
			print(impulse)
			var collision_position: Vector3 = local_collision_pos - global_position
			apply_impulse(impulse, collision_position)
			local_collision_pos = null
		else:
			# TODO: need to remove self either when missed or after hitting something else/time period after hit = home run
			pass
