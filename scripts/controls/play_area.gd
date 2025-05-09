extends Area2D

func _on_area_entered(area):
	area.add_to_queue()
