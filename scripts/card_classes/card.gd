extends Control
class_name Card

const HOVER_OFFSET = -50.0

@onready var outer_border = $UI/outer_border
@onready var background = $UI/outer_border/background
@onready var inner_border = $UI/outer_border/background/inner_border
@onready var text_background = $UI/outer_border/background/inner_border/text_background
@onready var description = $UI/description
@onready var corruption = $UI/corruption
@onready var cost = $UI/cost
@onready var card_name = $UI/card_name
@onready var ui = $UI

var hovered_over = false
var draggable = false
var is_in_queue = false
var player
var selected_card

func set_up(data: CardData):
#	load data
	outer_border.texture = load(data.outer_border_image_path)
	inner_border.texture = load(data.inner_border_image_path)
	background.texture = load(data.background_image_path)
	text_background.texture = load(data.text_background_image_path)
	description.text = str(data.description)
	corruption.text = str(data.corruption)
	cost.text = str(data.cost)
	card_name.text = str(data.card_name)
	player = get_tree().get_first_node_in_group("player")
	selected_card = player.selected_card

func _physics_process(delta):
#	create dragging && make sure only one card is dragged
	if hovered_over:
		if !selected_card:
			ui.position.y = lerp(ui.position.y, HOVER_OFFSET, 10 * delta)
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && !selected_card:
			draggable = true
			selected_card = self
		elif Input.is_action_just_released("mouse_left"):
			draggable = false
			selected_card = null
			if is_in_queue == false:
				player.add_card_to_hand(self)
	else:
		ui.position.y = lerp(ui.position.y, 0.0, 10 * delta)
	if draggable && selected_card == self:
		ui.position.y = 0
		global_position = Vector2(get_global_mouse_position().x - custom_minimum_size.x/2, get_global_mouse_position().y - 32)

func _on_draggable_zone_mouse_entered():
	hovered_over = true
	
func _on_draggable_zone_mouse_exited():
	hovered_over = false

func play():
	pass
