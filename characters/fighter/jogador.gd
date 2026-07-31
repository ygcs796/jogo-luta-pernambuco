extends CharacterBody2D

@export var speed := 300.0
@export var jump_velocity := -400.0
@export var gravity := 1200.0

@onready var state_machine = $StateMachine
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# adiciona a gravidade
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# chama a maquina de estados
	state_machine.physics_update(delta)

	move_and_slide()

func _ready():
	# inicializa como estado idle
	state_machine.change_state("Idle")

# funcao para inciar a animacao escolhida
func play_animation(name: String):
	if(sprite.animation != name):
		sprite.play(name)
