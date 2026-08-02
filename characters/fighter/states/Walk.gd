extends State

# aciona a animacao assim que inicia o estado
func enter():
	print("Estado -> Walk")
	jogador.play_animation("walk")

func physics_update(delta):
	
	var direction := Input.get_axis("andar_esq", "andar_dir")
	
	jogador.velocity.x = direction * jogador.speed
	
	# se nao mudou de direcao, personagem fica parado e muda de estado
	if(direction == 0):
		get_parent().change_state("Idle")
	
	# se foi precionado o botão de espaco, muda para o estado de jump
	if(Input.is_action_just_pressed("pular") and jogador.is_on_floor()):
		get_parent().change_state("Jump")
	
	if(Input.is_action_just_pressed("ataque_simples")):
		get_parent().change_state("Attack")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
