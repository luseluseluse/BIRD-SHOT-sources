extends Control

@onready var gunBullets : int
@onready var gunCanFire : bool

func _process(_delta: float) -> void:
	gunBullets = get_parent().bullets
	gunCanFire = get_parent().canFire
	if gunBullets <= 0:
		$AnimationPlayer.play("reloadText")

	if gunBullets > 0 and not gunCanFire and Input.is_action_just_pressed("fire"):
		$AnimationPlayer.play("pumpText")


func pumpReloadTextAnimFinished(anim_name: StringName) -> void:
	"""
	if anim_name == "reloadText":
		if gunBullets > 0:
			$AnimationPlayer.play("RESET")
	"""

	if anim_name == "pumpText":
		$AnimationPlayer.play("RESET")


func gunReload() -> void:
	$AnimationPlayer.play("RESET")
