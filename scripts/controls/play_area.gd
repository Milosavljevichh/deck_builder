extends Area2D
class_name PlayArea

var is_players_turn
var is_in_play_range
var selected_card
var queue := []

func _ready():
	is_players_turn = false

func _on_area_entered(card_draggable_area):
	print('card entered play area')
	print(card_draggable_area.get_parent())
	is_in_play_range = true
	selected_card = card_draggable_area.get_parent()
	selected_card.Add_to_queue.connect(add_to_queue)

func add_to_queue(card_to_add : Card):
	card_to_add.is_in_queue = true
	if is_players_turn && is_in_play_range:
		queue.push_front(selected_card)

func play_queue():
	for card in queue:
		card.play()
		queue.pop_front()


func _on_area_exited(card):
	is_in_play_range = false
	print('card exited play area')
