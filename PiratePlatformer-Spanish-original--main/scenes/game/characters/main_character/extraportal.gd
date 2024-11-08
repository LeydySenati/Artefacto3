extends CharacterBody2D


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Portal"):
		position.x=511
		position.y=-64
	if area.is_in_group("Portal2"):
		position.x=511
		position.y=225
