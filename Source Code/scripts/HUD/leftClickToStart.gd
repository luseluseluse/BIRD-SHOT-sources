extends Label

@export var flash : ColorRect

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		# Reset ending variables
		Global.actTwoEnemiesKilled = 0
		Global.actThreeEnemiesKilledByPlayer = 0
		Global.actThreeEnemiesKilledByShotty = 0
		Dialogic.VAR.set("WinnieSucksAss", false)
		Dialogic.VAR.set("MarlonWins", false)
		flash.flash()

func _ready() -> void:
	Dialogic.end_timeline() # This is for when the credits end.
	$FlashingTextAnim.play("textFlash")
	$FlashingTextAnim.connect("animation_finished", textAnimFin)

func textAnimFin(animName : String):
	if animName == "textFlash":
		$FlashingTextAnim.play("textFlash")
