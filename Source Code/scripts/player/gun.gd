extends Area2D

@export_group("Stats")
## Changes starting bullets
@export var bullets : int = 5
## Changes the max amount of bullets the gun can hold
@export var maxBullets : int = 5

@export_group("Sounds")
@export var gunRack : AudioStreamPlayer
@export var gunFire : AudioStreamPlayer
@export var gunReload : AudioStreamPlayer
@export var gunDryFire : AudioStreamPlayer
var canFire : bool = true
var canReload : bool = true
var controllerSpeed : int = 1000

signal fire(currentBullets)
signal reload()
signal chamber()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("fire") and canFire:
		fire.emit(bullets)
		canFire = false
		canReload = false
		$ReloadDelay.start()

	if event.is_action_pressed("fire") and not canFire:
		gunDryFire.play()

	if event.is_action_pressed("cycle") and canFire and bullets >= 1:
		bullets -= 1
		gunRack.play()
		chamber.emit(1)

	if event.is_action_pressed("cycle") and not canFire and not bullets <= 0:
		canFire = true
		gunRack.play()
		chamber.emit(0)

	if event.is_action_pressed("reload") and bullets < maxBullets and canReload:
		reload.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if bullets <= 0:
		bullets = 0
		canFire = false

	position = get_global_mouse_position()

	$DevTest/GeneralText.text = "CanFire: " + str(canFire) + "\nBullets: " + str(bullets)


func fired(_currentBullets) -> void:
	bullets -= 1
	gunFire.play()


func reloading() -> void:
	gunReload.play()
	bullets += 1


func reloadDelay() -> void:
	canReload = true
