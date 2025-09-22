extends CharacterBody2D


const SPEED = 150.0
const DASH_SPEED = 300.0
var isDashing = false;
var canDash = true;
var hasDied = false;

@onready var ap = $AnimatedSprite2D;

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if(GameManager.isPlayerDead):
		return;
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("Clover") and GameManager.clovers > 0:
		GameManager.clovers -= 1;

	# Handle Jump.
	if Input.is_action_just_pressed("Dash") and canDash:
		isDashing = true;
		canDash = false;
		$DashTimer.start();
		$DashCooldown.start();

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		ap.play("running");
		if direction < 0:
			ap.flip_h = true
		elif direction > 0:
			ap.flip_h = false
			
		if isDashing:
			velocity.x = direction * DASH_SPEED
		else:
			velocity.x = direction * SPEED;
	else:
		ap.play("default");
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide();

func die():
	ap.play("death");

func _on_dash_timer_timeout():
	isDashing = false # Replace with function body.

func _on_dash_cooldown_timeout():
	canDash = true; # Replace with function body.
	

func _on_animated_sprite_2d_animation_finished():
	if(GameManager.isPlayerDead):
		get_tree().change_scene_to_file('res://UI/victory_screen.tscn');
