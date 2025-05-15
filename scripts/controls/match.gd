extends Node2D

@onready var match_fsm = $MatchFsm
@onready var play_area = $PlayArea
@onready var player = $Player

var player_turn

func _ready():
	match_fsm.start()

func _process(delta):
	$debug.text = match_fsm.current_state.name

func set_turn(who:String):
	if who == "player":
		player_turn = true
		play_area.player_turn = true
		player.set_turn(true)
	elif who == "enemy":
		player_turn = false
		play_area.player_turn = false
		player.set_turn(false)
	else:
		push_error("in match control script, set_turn's parameter is: "+who)
