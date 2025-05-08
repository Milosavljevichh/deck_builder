extends Node
class_name Card

@export var data: CardData

func _ready():
	var children = get_children()
	for child in children:
		
		if child.get_class() == "Label":
			var text = str(data[child.name])
			if text:
				child.text = text
			else:
				push_error("No defined text for: "+ child.name + ". Note: check name matching")
			
		elif child.get_class() == "Sprite2D":
			var image_path = data[child.name + "_image_path"]
			if image_path:
				var image = load(image_path)
				child.texture = image
			else:
				push_error("No defined texture path for: "+ child.name + " in '" + data.card_name + "' card. Note: check name matching")
			
