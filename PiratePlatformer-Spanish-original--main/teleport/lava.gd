extends CharacterBody2D




func _on_attack_lava_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		# Llama al método 'hit' en el script de movimiento del jugador para aplicar daño
		var player_script = body.get_node("MainCharacterMovement")
		if player_script and player_script.has_method("hit"):
			player_script.hit(10)
