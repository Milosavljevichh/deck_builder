extends Node2D

var queued_cards : Array[Card]= []

func add_card_to_queue(card: Card):
	queued_cards.push_front(card)

func play_cards():
	for card in queued_cards:
		card.play()
