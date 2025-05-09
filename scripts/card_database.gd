extends Node

var all_cards: Dictionary = {}

func _ready():
#	napraviti da loopuje kroz folder i da ih tako doda
	all_cards["prototype_card"] = preload("res://scenes/cards/prototype_card.tres")
