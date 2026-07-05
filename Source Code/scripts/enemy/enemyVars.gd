extends Path2D

@export var secondActEnemy : bool = false
@export var finalActEnemy : bool = false
@export var startInstantly : bool = true
@export var speed : int = 100
@export var timeBeforeDeath : float = 1.0
@export var randomChanceNumber : int = 550

func _ready() -> void:
	$PathFollow2D.roundStart = startInstantly
	$PathFollow2D.speed = speed
	$PathFollow2D/TestEnemy.seEnemy = secondActEnemy
	$PathFollow2D/TestEnemy.aFEnemy = finalActEnemy
	$PathFollow2D/TestEnemy.timeBeforeDih = timeBeforeDeath
	$PathFollow2D/TestEnemy.maxNumber = randomChanceNumber
