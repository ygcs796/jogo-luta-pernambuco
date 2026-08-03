extends CharacterBody2D

@export var vida := 100

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()

func receber_dano(dano: int):
	vida -= dano
	print("Vida:", vida)
