extends Node
class_name FSM

@export var initial_state : State

var current_state
var states := {}

func start():
	for state in get_children():
		if state is State:
			states[state.name.to_lower()] = state
			state.Transitioned.connect(on_state_transition)
	if initial_state:
		current_state = initial_state
		initial_state.on_state_entered()

func _physics_process(delta):
	if current_state:
		current_state.on_state_update(delta)

func on_state_transition(state, new_state, args = null):
	if state != current_state || !states.has(new_state.to_lower()):
		return
	
	if current_state:
		current_state.on_state_exited()
	
	var new_state_inst = states[new_state.to_lower()]
	current_state = new_state_inst
	
	new_state_inst.on_state_entered(args)
