extends State

var match_parent
var player : Player

func _ready():
	match_parent = get_parent().get_parent()
	player = match_parent.get_node("Player")

func on_state_entered(args = null):
	match_parent.set_turn("player")


func _on_player_finished_turn():
	Transitioned.emit(self, possible_states[0].name.to_lower())
