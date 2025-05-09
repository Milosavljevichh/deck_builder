extends Node

@onready var deck = $deck
@onready var health_label = $health/health_label
@onready var all_cards = card_database.all_cards
@onready var handBox = $hand/HBoxContainer
@onready var hand = $hand

@onready var card_scene = preload("res://scenes/card_classes/card.tscn")

@export var starting_health := 100

var discard_pile := []
var current_deck
var hand_array := []
var selected_card: Control:
	get:
		return selected_card
	set(value):
		if value:
			value.get_parent().remove_child(value)
			hand.add_child(value)
		selected_card = value

var health: int:
	get:
		return health
	set(value):
		health = value

func _ready():
	health = starting_health
	selected_card = null
#	function for shuffling deck
	current_deck = deck.card_inventory
	draw_cards(5)

func _process(delta):
	health_label.text = str(health)

func draw_cards(amount: int):
	for i in range(0, amount):
		var top_card = card_scene.instantiate()
		handBox.add_child(top_card)
		top_card.set_up(current_deck.pop_front())
		hand_array.push_back(top_card)
	print(hand_array)
