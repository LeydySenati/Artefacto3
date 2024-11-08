extends CharacterBody2D  # O KinematicBody2D si estás usando Godot 3.x

# Variables de velocidad y dirección
var speed = 100
var direction = -1  # Comienza moviéndose hacia la izquierda

# Límites de patrullaje
var left_limit = Vector2(280, 0)
var right_limit = Vector2(500, 0)

@onready var animated_sprite = $AnimatedSprite2D

@export var damage: int = 10  # Daño que el escorpión inflige
@onready var attack_area: Area2D = $AttackArea  

func _ready():
	attack_area.connect("body_entered", Callable(self, "_on_body_entered"))
	# Asegúrate de que el personaje empiece mirando hacia la izquierda
	animated_sprite.flip_h = false  # El personaje empieza mirando hacia la izquierda
	velocity.x = direction * speed  # Inicializa la velocidad hacia la izquierda
	
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		# Llama al método 'hit' en el script de movimiento del jugador para aplicar daño
		var player_script = body.get_node("MainCharacterMovement")
		if player_script and player_script.has_method("hit"):
			player_script.hit(10)
		
func _process(delta):
	velocity.x = direction * speed  # Mueve el personaje en la dirección actual

	# Cambia de dirección cuando alcanza los límites
	if position.x <= left_limit.x:
		direction = 1  # Cambia a la derecha
		animated_sprite.flip_h = true  # Voltea la imagen hacia la derecha
	elif position.x >= right_limit.x:
		direction = -1  # Cambia a la izquierda
		animated_sprite.flip_h = false  # Voltea la imagen hacia la izquierda

	# Aplica el movimiento
	move_and_slide()
