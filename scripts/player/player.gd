extends Node
class_name Player

@onready var deck = $deck
@onready var health_label = $health/health_label
@onready var all_cards = card_database.all_cards
@onready var handBox = $hand/HBoxContainer
@onready var hand = $hand

@export var starting_health := 100

var discard_pile := []
var current_deck
var selected_card: Card:
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
	create_deck()
	$PlayerFSM.start()

func shuffle_deck():
	current_deck.shuffle()

func create_deck():
	current_deck = deck.card_inventory.duplicate()
	shuffle_deck()

func _process(delta):
	health_label.text = str(health)
	$hand/debug_label.text = str($PlayerFSM.current_state.name)

func add_card_to_hand(card: Card):
	if card.get_parent():
		card.get_parent().remove_child(card)
	handBox.add_child(card)
