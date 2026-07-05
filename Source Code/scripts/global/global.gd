extends Node

# Act Two variables
var actTwoEnemiesKilled : int = 0

# Act Three variables
var actThreeEnemiesKilledByPlayer : int = 0
var actThreeEnemiesKilledByShotty : int = 0

# False = Fullscreen, True = Windowed
var fullScreenOrWindow = false

signal fullscreenChange

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("quit"):
		get_tree().quit()

	if event.is_action_pressed("fullScreen"):
		fullscreenChange.emit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("fullscreenChange", changeScreen)
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func changeScreen():
	if fullScreenOrWindow == false:
		fullScreenOrWindow = true
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_size(Vector2i(640,480))
	else:
		fullScreenOrWindow = false
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
