extends RigidBody2D

func _ready() -> void:
	# Optional: ensure gravity affects this body
	gravity_scale = 1.0
	var angle_variance: float = randf_range(-10.0, 10.0);
	var angle_rad = deg_to_rad(angle_variance)
	var direction = Vector2(sin(angle_rad), -cos(angle_rad))
	
	# Apply impulse force
	apply_central_impulse(direction * 250.0) # Replace with function body.


func _on_body_entered(body):# Replace with function body.
	print(body)
	if body.is_in_group("ground"):
		GameManager.score += 5
		queue_free();
	if body.is_in_group("player"):
		GameManager.isPlayerDead = true;
	if body.is_in_group("layer-switcher"):
		set_visibility_layer_bit(3, true);
		set_collision_mask_value(3, true);
		print("layer-switcher");
