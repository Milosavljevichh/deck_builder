extends Button

@export var to_state : State
@export var from_state : State

func _on_pressed():
	if to_state.name.to_lower() == "drawstate":
		to_state.Transitioned.emit(from_state, to_state.name.to_lower(), 1)
	else:
		
		to_state.Transitioned.emit(from_state, to_state.name.to_lower())
