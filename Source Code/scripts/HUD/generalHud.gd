extends Node

signal createBulletHUD
signal createShellHUD

@export var gunVars : Area2D
## False = Bullets, True = Shells
@export var bulletOrShells : bool = false

func _ready() -> void:
	gunVars.connect("fire", gunFired)
	gunVars.connect("chamber", gunChambered)
	gunVars.connect("reload", gunReload)
	
	if not bulletOrShells:
		createBulletHUD.emit()
	else:
		createShellHUD.emit()

func _process(_delta: float) -> void:
	$ShellsOrBullets.amountOfBullets = gunVars.bullets

func gunFired(_currentBullets: Variant) -> void:
	if gunVars.bullets >= 0:
		$Flash/FlashAnim.play("flash")
		$ShellsOrBullets.fire()

func gunChambered(_check: int) -> void:
	if _check > 0:
		$ShellsOrBullets.chamber()


func gunReload() -> void:
	$ShellsOrBullets.reload()
