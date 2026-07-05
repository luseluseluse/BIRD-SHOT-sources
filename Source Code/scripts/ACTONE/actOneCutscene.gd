extends Control

@export var flash : ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(dialogicSignal)
	Dialogic.timeline_ended.connect(dialogEnded)
	Dialogic.start("res://dialog/ACTONE/ActOneCutsceneDialog.dtl")

func dialogicSignal(argument : String):
	if argument == "actOneSceneChange":
		$ChangeBackgrounds.play("shot2")

func dialogEnded():
	Dialogic.timeline_ended.disconnect(dialogEnded)
	flash.flash()
