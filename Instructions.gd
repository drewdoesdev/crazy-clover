extends Node2D

var isReady = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(is_anything_pressed() && isReady):
		GameTimer.start();
		GameTimer.paused = false;
		get_tree().change_scene_to_file('res://Scenes/stage.tscn');
	
func is_anything_pressed()->bool:
	var InputMapList:Array = InputMap.get_actions()
	for actions in InputMapList:
		if Input.is_action_pressed(actions):
			return true
	return false
	

func _on_timer_timeout():
	isReady = true;
