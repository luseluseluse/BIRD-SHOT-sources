extends Label

@export var flash : ColorRect

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		flash.flash()

	if event.is_action_pressed("cycle"):
		get_tree().quit()
		