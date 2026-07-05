extends Node

signal roundChange

@export var flash : ColorRect
## IMPORTANT NOTE: MAKE SURE THE ROUND TIMER IS SET TO ONE SHOT.
@export var roundTransTimer : Timer

var currentRound : int = 1
var roundChangeSignalEmitting : bool = false

@export var roundOne : Node
@export var roundTwo : Node
@export var roundThree : Node
@export var roundFour : Node
@export var roundFive : Node

func roundChildCount() -> void:
	if not currentRound > 5:
		if get_tree().get_node_count_in_group("round" + str(currentRound)) <= 0:
			if not roundChangeSignalEmitting:
				roundChange.emit()
				roundChangeSignalEmitting = true
	else:
		flash.flash()

func onRoundChange() -> void:
	roundTransTimer.start()

func _ready() -> void:
	connect("roundChange", onRoundChange)
	roundTransTimer.connect("timeout", roundTransitionWaitTimeOver)

func _process(_delta: float) -> void:
	roundChildCount()

func roundTransitionWaitTimeOver() -> void:
	match currentRound:
		1:
			roundChangeSignalEmitting = false
			roundOne.process_mode = Node.PROCESS_MODE_DISABLED
			roundTwo.process_mode = Node.PROCESS_MODE_INHERIT
			currentRound += 1
		2:
			roundChangeSignalEmitting = false
			roundTwo.process_mode = Node.PROCESS_MODE_DISABLED
			roundThree.process_mode = Node.PROCESS_MODE_INHERIT
			currentRound += 1
		3:
			roundChangeSignalEmitting = false
			roundThree.process_mode = Node.PROCESS_MODE_DISABLED
			roundFour.process_mode = Node.PROCESS_MODE_INHERIT
			currentRound += 1
		4:
			roundChangeSignalEmitting = false
			roundFour.process_mode = Node.PROCESS_MODE_DISABLED
			roundFive.process_mode = Node.PROCESS_MODE_INHERIT
			currentRound += 1
		5:
			roundChangeSignalEmitting = false
			currentRound += 1
			pass
