extends Button

@export var to_state : State
@export var from_state : State

var player : Player

func _ready():
	player = get_parent().get_parent().get_parent()

func _on_pressed():
	to_state.Transitioned.emit(from_state, to_state.name.to_lower())
	player.FinishedTurn.emit()
