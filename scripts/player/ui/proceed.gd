extends Button

@export var to_state : State
@export var from_state : State

func _on_pressed():
	to_state.Transitioned.emit(from_state, to_state.name.to_lower())
