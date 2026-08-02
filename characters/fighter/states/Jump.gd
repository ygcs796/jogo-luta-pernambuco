extends State

# aciona a animacao assim que inicia o estado
func enter():
	print("Estado -> jump")
	if(Input.is_action_just_pressed("pular") and jogador.is_on_floor()): # aciona o pula
		jogador.velocity.y = jogador.jump_velocity
		
	jogador.play_animation("idle")

func physics_update(delta):
	
	
	if(not jogador.is_on_floor()): # aplica a gravidade no momento seguinte ao pulo
		jogador.velocity.y += jogador.gravity*delta
	else: # quando chega no chao, muda o estado
		get_parent().change_state("Idle")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
