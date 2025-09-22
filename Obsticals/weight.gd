extends RigidBody2D

@onready var animated_sprite = $AnimatedSprite2D;

func _ready() -> void:
	# Optional: ensure gravity affects this body
	gravity_scale = 1.0
	var angle_variance: float = randf_range(-10.0, 10.0);
	var angle_rad = deg_to_rad(angle_variance)
	var direction = Vector2(sin(angle_rad), -cos(angle_rad))
	
	# Apply impulse force
	apply_central_impulse(direction * 250.0) # Replace with function body.
	
func _process(delta):
	if(GameManager.isPlayerDead):
		animated_sprite.visible = false;

func _on_body_entered(body):# Replace with function body.
	if body.is_in_group("ground"):
		if !GameManager.isPlayerDead:
			calculate_score();
		queue_free();
	if body.is_in_group("player"):
		GameManager.isPlayerDead = true;
		body.die();
		
func calculate_score():
	var scoreMultiplier = 1;
	if(GameManager.clovers == 3):
		scoreMultiplier = 1.5;
	if(GameManager.clovers == 2):
		scoreMultiplier = 2;
	if(GameManager.clovers == 1):
		scoreMultiplier = 2.5;
	if(GameManager.clovers == 0):
		scoreMultiplier = 3;
	
	GameManager.score += 5 * scoreMultiplier;


func _on_flip_timer_timeout():
	if(animated_sprite):
		var currentFlip = animated_sprite.flip_h;
		if(currentFlip):
			animated_sprite.flip_h = false;
		else:
			animated_sprite.flip_h = true;
	
