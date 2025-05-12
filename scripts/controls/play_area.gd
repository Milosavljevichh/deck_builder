extends Area2D
class_name PlayArea

var is_players_turn
var is_in_play_range
var selected_card
var queue := []

func _ready():
	is_players_turn = false

func _on_area_entered(card):
	is_in_play_range = true
	selected_card = card

func _physics_process(delta):
	if is_players_turn && is_in_play_range:
		queue.push_front(selected_card)

func play_queue():
	for card in queue:
		card.play()
		queue.pop_front()


func _on_area_exited(card):
	is_in_play_range = false
