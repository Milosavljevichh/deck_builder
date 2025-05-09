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

func set_up(data: CardData):
	outer_border.texture = load(data.outer_border_image_path)
	inner_border.texture = load(data.inner_border_image_path)
	background.texture = load(data.background_image_path)
	text_background.texture = load(data.text_background_image_path)
	description.text = str(data.description)
	corruption.text = str(data.corruption)
	cost.text = str(data.cost)
	card_name.text = str(data.card_name)

func _physics_process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && hovered_over:
		draggable = true
	else:
		draggable = false
	if draggable:
		global_position = Vector2(get_global_mouse_position().x - custom_minimum_size.x/2, get_global_mouse_position().y - 32)

func _on_draggable_zone_mouse_entered():
	hovered_over = true

func _on_draggable_zone_mouse_exited():
	if !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		hovered_over = false
