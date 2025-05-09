extends Control
class_name Card

@onready var outer_border = $outer_border
@onready var background = $outer_border/background
@onready var inner_border = $outer_border/background/inner_border
@onready var text_background = $outer_border/background/inner_border/text_background
@onready var description = $description
@onready var corruption = $corruption
@onready var cost = $cost
@onready var card_name = $card_name

var hovered_over = false
var draggable = false
var player

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

func _physics_process(_delta):
#	create dragging && make sure only one card is dragged
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && hovered_over && !player.selected_card:
		draggable = true
		player.selected_card = self
	elif !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		draggable = false
		player.selected_card = null
	if draggable && player.selected_card == self:
		global_position = Vector2(get_global_mouse_position().x - custom_minimum_size.x/2, get_global_mouse_position().y - 32)

func _on_draggable_zone_mouse_entered():
	hovered_over = true
#control letting go of a card
func _on_draggable_zone_mouse_exited():
	if !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		hovered_over = false
