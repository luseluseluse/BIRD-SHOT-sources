extends Control

@export var flash : ColorRect
@export var anim : AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.connect("animation_finished", credits)
	anim.play("titleDrop")

func credits(animName : StringName):
	if animName == "titleDrop":
		anim.play("TeamCredits")

	if animName == "TeamCredits":
		anim.play("GodotLicense")

	if animName == "GodotLicense":
		anim.play("DialogicLicense")
	
	if animName == "DialogicLicense":
		anim.play("ThankYouForPlaying")

	if animName == "ThankYouForPlaying":
		flash.flash()
