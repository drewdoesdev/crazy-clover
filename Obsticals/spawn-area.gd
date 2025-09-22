extends Area2D

@onready var object_to_spawn = preload("res://Obsticals/weight.tscn");
@onready var collision_shape = $CollisionShape2D;
@onready var baseTimer = $Timer.timeout;
@onready var cloverTracker = GameManager.clovers

func _process(delta):
	if((GameManager.isPlayerDead || GameManager.isTimeout) && !$Timer.is_stopped()):
		$Timer.stop();
		
	if(cloverTracker && cloverTracker != GameManager.clovers ):
		update_spawnrate();
		cloverTracker = GameManager.clovers;
# Called when the node enters the scene tree for the first time.
func _on_timer_timeout() -> void:
	var obj = object_to_spawn.instantiate();
	var pointA = collision_shape.shape.a.x;
	var pointB = collision_shape.shape.b.x;
	var randX: int = randf_range(pointA, pointB);
	obj.position = to_global(Vector2(randX, 0));
	get_parent().add_child(obj);
	get_parent().move_child(obj, 0);

func update_spawnrate() -> void:
	$Timer.stop();
	var newTime: float = 1.0;
	if(GameManager.clovers == 3):
		newTime = 0.5;
	if(GameManager.clovers == 2):
		newTime = 0.25;
	if(GameManager.clovers == 1):
		newTime = 0.129;
	if(GameManager.clovers == 0):
		newTime = 0.05;
	$Timer.start(newTime);
