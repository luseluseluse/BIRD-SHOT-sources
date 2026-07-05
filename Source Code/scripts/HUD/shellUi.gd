extends Node

var amountOfBullets : int

var bulletHUDScene = load("res://scenes/UI/bullet_container.tscn")
var shellHUDScene = load("res://scenes/UI/shell_container.tscn")

var bulletInstance = bulletHUDScene.instantiate()
var shellInstance = shellHUDScene.instantiate()

var bulletCreated : bool = false
var shellCreated : bool = false

func _process(_delta: float) -> void:
	if shellCreated:
		shellInstance.gunBullets = amountOfBullets

	if bulletCreated:
		bulletInstance.gunBullets = amountOfBullets

func fire():
	if shellCreated:
		shellInstance.fire()

	if bulletCreated:
		bulletInstance.fire()

func chamber():
	if shellCreated:
		shellInstance.chamber()

	if bulletCreated:
		bulletInstance.chamber()

func reload():
	if shellCreated:
		shellInstance.reload()
	if bulletCreated:
		bulletInstance.reload()

func receiveBulletHUDCreate() -> void:
	add_child(bulletInstance)
	bulletCreated = true


func receiveShellHUDCreate() -> void:
	add_child(shellInstance)
	shellCreated = true
