extends Control

@export var flash : ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.actThreeEnemiesKilledByPlayer >= Global.actThreeEnemiesKilledByShotty:
		Dialogic.VAR.set("MarlonWins", true)
	else:
		Dialogic.VAR.set("MarlonWins", false)


	Dialogic.signal_event.connect(dialogicSignal)
	Dialogic.timeline_ended.connect(dialogEnded)
	Dialogic.start("res://dialog/ENDING/ending.dtl")

func dialogicSignal(argument : String):
	if argument == "CloseUpSmile":
		$ChangeBackgrounds.play("closeUp")

	if argument == "WinnieSittingDown":
		$ChangeBackgrounds.play("sittingDown")

	if argument == "WinnieLooksDown":
		$ChangeBackgrounds.play("WinnieLooksDown")

	if argument == "WinnieLooksUp":
		$ChangeBackgrounds.play("WinnieLooksUp")
	
	if argument == "MarltonBringsOutGun":
		$ChangeBackgrounds.play("MarltonBringsOutGun")

	if argument == "WinnieLooksBack":
		$ChangeBackgrounds.play("WinnieLooksBack")

	if argument == "WinniePoint":
		$ChangeBackgrounds.play("WinniePoint")

	if argument == "CloseUpOfMarltonsFinger":
		$ChangeBackgrounds.play("CloseUpOfMarltonsFinger")

	if argument == "MarltonHolster":
		$ChangeBackgrounds.play("MarltonHolster")

	if argument == "WinnieConfusion":
		$ChangeBackgrounds.play("WinnieConfusion")

	if argument == "MarltonSmirks":
		$ChangeBackgrounds.play("MarltonSmirks")

	if argument == "WinnieScoffs":
		$ChangeBackgrounds.play("WinnieScoffs")

	if argument == "MarltonStern":
		$ChangeBackgrounds.play("MarltonStern")

	if argument == "MarltonWalk":
		$ChangeBackgrounds.play("MarltonWalk")

	if argument == "WinnieWalkAway":
		$ChangeBackgrounds.play("WinnieWalkAway")

func dialogEnded():
	Dialogic.timeline_ended.disconnect(dialogEnded)
	flash.flash()
