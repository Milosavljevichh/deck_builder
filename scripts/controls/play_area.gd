extends Area2D
class_name PlayArea

var player_turn
var is_in_play_range : bool
var queue := []

func _on_area_entered(card_draggable_area):
	var card : Card = card_draggable_area.get_parent()
	is_in_play_range = true
	card.Add_to_queue.connect(add_to_queue)

func add_to_queue(card : Card):
	var new_card = card.duplicate()
	if player_turn && is_in_play_range:
		card.is_in_queue = true
		queue.push_front(new_card)

func play_queue():
	for card in queue:
		card.play()
		queue.pop_front()


func _on_area_exited(card):
	is_in_play_range = false
	print('card exited play area')
