extends Area2D

signal dead
signal iamATarget

var ableToBeKilled : bool = false
var randomChance : int
var beingTargeted : bool = false
var isVisible : bool = false
var seEnemy : bool = false # Second Act keeps track of how many birds shot and killed
var aFEnemy : bool = false # Third Act keeps track of how many you and Willie have killed
var isDead : bool = false
var canBeTargetted : bool = false
var timeBeforeDih : float
var maxNumber : int

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("fire") and ableToBeKilled and isVisible:
		die(seEnemy, aFEnemy, false)

func _ready() -> void:
	if not beingTargeted:
		$AnimatedSprite2D.play("fly")

	$AnimatedSprite2D.connect("animation_looped", flap)

func _process(_delta: float) -> void:
	print(canBeTargetted)
	if aFEnemy and not is_connected("iamATarget", targetCode) and not $TimeBeforeDeath.is_connected("timeout", shottyWins):
		connect("iamATarget", targetCode)
		$TimeBeforeDeath.connect("timeout", shottyWins)
		$OnScreenTimerForACTIII.connect("timeout", enableTargeting)

	if canBeTargetted:
		randomChance = randi_range(1,maxNumber)

	if randomChance == 1 and not beingTargeted:
		iamATarget.emit()

	# Area entered breaks since it doesnt get the updated variable for
	# can fire, so i have to do this instead.
	var whatDoesTheAreaSee = get_overlapping_areas()

	for area in whatDoesTheAreaSee:
		if area.is_in_group("gun") and area.canFire:
			ableToBeKilled = true

	if beingTargeted and not isDead:
		$AnimatedSprite2D.play("targetted")

func targetCode():
	$TimeBeforeDeath.wait_time = timeBeforeDih
	beingTargeted = true
	$Crosshair.show()
	$Crosshair.play("loop")
	$TimeBeforeDeath.start()

func shottyWins():
	die(false,true,true)

func notOnScreen() -> void:
	isVisible = false
	$VisibleOnScreenNotifier2D/Timer.start()

func enteredTheScreen() -> void:
	$OnScreenTimerForACTIII.timeout.emit()
	isVisible = true
	if $VisibleOnScreenNotifier2D/Timer.time_left > 0.0:
		$VisibleOnScreenNotifier2D/Timer.stop()

func offScreenTimeout() -> void:
	get_parent().get_parent().queue_free()

func fistOfTheNorthStar(area: Area2D) -> void:
	if area.is_in_group("gun"):
		ableToBeKilled = false

func die(secondAct : bool, thirdAct: bool, diedByWillie : bool) -> void:
	$BEEPBEEPBEEP.stop()
	isDead = true
	if secondAct:
		Global.actTwoEnemiesKilled += 1
	
	if thirdAct and diedByWillie:
		$Crosshair.hide()
		canBeTargetted = false
		Global.actThreeEnemiesKilledByShotty += 1
		$WillieShot.play()
	elif thirdAct and not diedByWillie:
		$Crosshair.hide()
		canBeTargetted = false
		Global.actThreeEnemiesKilledByPlayer += 1
		$TimeBeforeDeath.stop()
	
	$BirdHit.play()
	$AnimatedSprite2D.play("die")
	dead.emit()
	await $AnimatedSprite2D.animation_finished
	get_parent().get_parent().queue_free()

func flap():
	if $AnimatedSprite2D.animation == "fly":
		$BirdFlap.play()
		
	if $AnimatedSprite2D.animation == "targetted":
		$BEEPBEEPBEEP.play()

func enableTargeting(): 
	canBeTargetted = true
