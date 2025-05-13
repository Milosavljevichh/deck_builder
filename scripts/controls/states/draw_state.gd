extends State

@onready var card_scene = preload("res://scenes/card_classes/card.tscn")

@export var player : Player
@export var next_state : State
@export var proceed_btn : Button
@onready var timer = $Timer

func draw_cards(amount: int):
	for i in range(0, amount):
		var top_card = card_scene.instantiate()
		player.add_card_to_hand(top_card)
		top_card.set_up(player.current_deck.pop_front())

func on_state_entered(args = null):
	proceed_btn.disabled = true
	var draw_amount = 5
	if args is int:
		draw_amount = args
	if player.current_deck.size() - 1 > 0:
		draw_cards(draw_amount)
	else:
		player.create_deck()
		draw_cards(draw_amount)
	timer.start()

func on_state_exited():
	proceed_btn.disabled = false

func _on_timer_timeout():
	Transitioned.emit(self, next_state.name.to_lower(), null)
