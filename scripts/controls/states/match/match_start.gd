extends State
#in this state, both the player and the enemy should draw 5 cards each
var player : Player
var enemy : Enemy
var match_parent
@onready var timer = $Timer

var match_start = true

func _ready():
	match_parent = get_parent().get_parent()
	player = match_parent.get_node("Player")
	enemy = match_parent.get_node("Enemy")

func on_state_entered(args = null):
	player.start_fsm()
	#enemy.start_fsm()
	timer.start()


func _on_timer_timeout():
	Transitioned.emit(self, possible_states[0].name.to_lower(), null)
