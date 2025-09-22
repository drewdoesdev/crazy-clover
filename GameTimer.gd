extends Timer


# Called when the node enters the scene tree for the first time.
func _process(delta):
	if(Engine.has_singleton('GameManager')):
		if(GameManager && (GameManager.isPlayerDead || GameManager.isTimeout)):
			if(!is_stopped()):
				paused = true;

func _on_timeout():
	GameManager.isTimeout = true; # Replace with function body.
