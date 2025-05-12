extends State

@onready var card_scene = preload("res://scenes/card_classes/card.tscn")

@export var player : Player
@export var next_state : State

func draw_cards(amount: int):
	if player.current_deck.size() - 1 > 0:
		for i in range(0, amount):
			var top_card = card_scene.instantiate()
			player.add_card_to_hand(top_card)
			top_card.set_up(player.current_deck.pop_front())
			player.hand_array.push_back(top_card)
	else:
		player.create_deck()

func on_state_entered(args = null):
	var draw_amount = 5
	if args is int:
		draw_amount = args
	draw_cards(draw_amount)
	Transitioned.emit(self, next_state.name.to_lower(), null)
