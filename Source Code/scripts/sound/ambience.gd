extends AudioStreamPlayer

@export var flash : ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("finished", finishedDone)
	flash.connect("flashing", stopSoundWhenFlashing)

func finishedDone():
	play()

func stopSoundWhenFlashing():
	stop()
