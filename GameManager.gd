extends Node

@onready var instructions = preload('res://instructions.tscn')
@onready var stage = preload('res://Scenes/stage.tscn');

static var clovers: int = 4;
static var score: int = 0;
static var isGameStarted:bool = false;
static var isTimeout:bool = false;
static var isPlayerDead:bool = false;
static var isGameOver = false;

func _process(delta):
	if(is_anything_pressed() && !isGameStarted):
		isGameStarted = true;
		get_tree().change_scene_to_file('res://instructions.tscn');
		

func is_anything_pressed()->bool:
	var InputMapList:Array = InputMap.get_actions()
	for actions in InputMapList:
		if Input.is_action_pressed(actions):
			return true
	return false

func resetGame():
	clovers = 4;
	score = 0;
	isTimeout = false;
	isPlayerDead = false;
	isGameOver = false;
	
	get_tree().change_scene_to_file('res://Scenes/stage.tscn');
	
