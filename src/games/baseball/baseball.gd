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
			bat_velocity.z = min(bat_velocity.z, -1) # always hit the ball away from the player
			var speed: float = bat_velocity.length()
			var impulse: Vector3 = bat_velocity * (speed * 40)
			impulse.z = abs(impulse.z) * -1
			print(impulse)
			var collision_position: Vector3 = local_collision_pos - global_position
#			impulse = impulse.reflect(Vector3(0.0,0.0,1.0).normalized())
			apply_impulse(impulse, collision_position)
			local_collision_pos = null
		else:
			# TODO: need to remove self either when missed or after hitting something else/time period after hit = home run
			pass
