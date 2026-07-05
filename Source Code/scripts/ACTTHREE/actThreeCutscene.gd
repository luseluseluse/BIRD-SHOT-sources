extends Control

@export var flash : ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.actTwoEnemiesKilled < 8:
		Dialogic.VAR.set("WinnieSucksAss", true)

	Dialogic.signal_event.connect(dialogicSignal)
	Dialogic.timeline_ended.connect(dialogEnded)
	Dialogic.start("res://dialog/ACTTHREE/ActThreeCutscene.dtl")

func dialogicSignal(argument : String):
	if argument == "marlonImpressed":
		$ChangeBackgrounds.play("Shot1")

	if argument == "winnieSmile":
		$ChangeBackgrounds.play("Shot2")

	if argument == "marlonStandUp":
		$ChangeBackgrounds.play("Shot3")

	if argument == "marlonSitting":
		$ChangeBackgrounds.play("Shot4")
	
	if argument == "marlonWalkingAway":
		$ChangeBackgrounds.play("Shot5")

	if argument == "marlonSmirk":
		$ChangeBackgrounds.play("Shot6")

	if argument == "marlonLooksDown":
		$ChangeBackgrounds.play("Shot7")

	if argument == "marlonSighs":
		$ChangeBackgrounds.play("Shot8")

func dialogEnded():
	Dialogic.timeline_ended.disconnect(dialogEnded)
	flash.flash()
