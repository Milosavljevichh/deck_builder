extends State

var match_parent

func _ready():
	match_parent = get_parent().get_parent()

func on_state_entered(args = null):
	match_parent.set_turn("enemy")
