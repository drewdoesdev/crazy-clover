extends Area2D

@onready var object_to_spawn = preload("res://Obsticals/weight.tscn");
@onready var collision_shape = $CollisionShape2D;
# Called when the node enters the scene tree for the first time.
func _on_timer_timeout() -> void:
	var obj = object_to_spawn.instantiate();
	var pointA = collision_shape.shape.a.x;
	var pointB = collision_shape.shape.b.x;
	var randX: int = randf_range(pointA, pointB);
	obj.position = to_global(Vector2(randX, 0));
	get_parent().add_child(obj);
