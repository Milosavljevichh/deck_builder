extends Node2D
class_name Deck

var card_inventory := []

func _ready():
	var all_cards = card_database.all_cards
	card_inventory.push_back(all_cards["prototype_card"])
	card_inventory.push_back(all_cards["prototype_card2"])
	card_inventory.push_back(all_cards["prototype_card2"])
	card_inventory.push_back(all_cards["prototype_card"])
	card_inventory.push_back(all_cards["prototype_card"])
	card_inventory.push_back(all_cards["prototype_card"])
