extends CanvasLayer

@onready var finalScoreText = $ScoreScreen/FinalScore;

func _process(delta):
	if(GameManager):
		finalScoreText.text = 'Final Score: ' + str(GameManager.score);
	if(is_anything_pressed()):
		GameManager.resetGame();
		get_tree().change_scene_to_file('res://instructions.tscn');
		

func is_anything_pressed()->bool:
	var InputMapList:Array = InputMap.get_actions()
	for actions in InputMapList:
		if Input.is_action_pressed(actions):
			return true
	return false


