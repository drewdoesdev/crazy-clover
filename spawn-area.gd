extends Navigation

@onready var object_to_spawn = preload("./weight.tscn");
# Called when the node enters the scene tree for the first time.
func _on_timer_timeout() -> void:
	var obj = object_to_spawn.instantiate();
	obj.position = get_random_point();
	get_parent().add_child(obj);
