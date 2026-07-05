extends Control

@export var flash : ColorRect

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		flash.flash()


func _ready() -> void:
	$TextAnimation.play("TextAnim")
	$TextAnimation.connect("animation_finished", expositionTextFinished)
	$TimeToRead.connect("timeout", timeToReadIsOverKid)

func expositionTextFinished(_textName : String):
	$TimeToRead.start()

func timeToReadIsOverKid():
	flash.flash()
