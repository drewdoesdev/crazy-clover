extends RigidBody2D

func _ready() -> void:
	# Optional: ensure gravity affects this body
	gravity_scale = 1.0
	apply_impulse(Vector2(1,1), position);


func _on_body_entered(body):
	print('collision +', body) # Replace with function body.
	if body.is_in_group("ground"):
		queue_free();
