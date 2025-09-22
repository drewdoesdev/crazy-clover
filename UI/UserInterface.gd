extends CanvasLayer

@onready var cloverDisplay = $GameUI/Clover;
@onready var timeDisplay = $GameUI/Time;
@onready var scoreDisplay = $GameUI/Score;

var timeDispaly = 60;

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
		
	var timeLeft = str(roundf(GameTimer.time_left));
	timeDisplay.text = timeLeft;
