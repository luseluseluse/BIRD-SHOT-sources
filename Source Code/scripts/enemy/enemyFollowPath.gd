extends PathFollow2D

@onready var enemy = $TestEnemy

var enemyNotDead : bool = true
var roundStart : bool
var speed : int

func _ready() -> void:
	enemy.connect("dead", enemyDied)
	$StartTimer.connect("timeout", goAheadMan)
	$StartTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if roundStart and enemyNotDead:
		progress += speed * delta

func enemyDied() -> void:
	enemyNotDead = false

func goAheadMan():
	roundStart = true
