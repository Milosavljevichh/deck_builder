extends State

@export var next_state : State
@export var proceed_btn : Button

func on_state_entered(args = null):
	proceed_btn.from_state = self
	proceed_btn.to_state = next_state
	get_parent().get_parent().set_turn(false)

func on_state_exited():
	pass
