extends CanvasLayer

@onready var cloverDisplay = $GameUI/MarginContainer/Clover;
@onready var timeDisplay = $GameUI/MarginContainer/Time;
@onready var scoreDisplay = $GameUI/MarginContainer/Score;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var cloversString = str(GameManager.clovers);
	if(cloverDisplay.text != cloversString):
		cloverDisplay.text = cloversString;
		
	var scoreString = str(GameManager.score);
	if(scoreDisplay.text != scoreString):
		scoreDisplay.text = scoreString;
