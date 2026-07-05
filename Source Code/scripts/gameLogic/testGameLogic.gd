extends Node2D

signal roundChange

var currentRound : int = 1

@export var maxRound : int = 5
	

func roundCheck() -> void:
	var roundChildrenCheck = get_children()