extends Node
class_name State

@export var possible_states : Array[State]

signal Transitioned

func on_state_entered(args = null):
	pass

func on_state_exited():
	pass

func on_state_update(delta):
	pass
