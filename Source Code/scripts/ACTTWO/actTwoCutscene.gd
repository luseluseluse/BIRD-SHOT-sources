extends Control

@export var flash : ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(dialogicSignal)
	Dialogic.timeline_ended.connect(dialogEnded)
	Dialogic.start("res://dialog/ACTTWO/ActTwoCutscene.dtl")

func dialogicSignal(argument : String):
	if argument == "quickDrawBG":
		$ChangeBackgrounds.play("shot2")

	if argument == "marlonSurprisedLook":
		$ChangeBackgrounds.play("shot3")

	if argument == "winnieReveal":
		$ChangeBackgrounds.play("shot4")

	if argument == "shootGunhead":
		$ChangeBackgrounds.play("shot5")

	if argument == "unimpressedMarlon":
		$ChangeBackgrounds.play("shot6")

	if argument == "buffArmReveal":
		$ChangeBackgrounds.play("shot7")

func dialogEnded():
	Dialogic.timeline_ended.disconnect(dialogEnded)
	flash.flash()
