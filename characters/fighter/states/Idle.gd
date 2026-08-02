extends State

# aciona a animacao assim que inicia o estado
func enter():
	print("Estado -> idle")
	jogador.play_animation("idle")

func physics_update(delta):
	
	jogador.velocity.x = 0
	
	# se andar, muda o estado
	if(Input.is_action_pressed("andar_esq") or 
	Input.is_action_pressed("andar_dir")):
		get_parent().change_state("Walk")
	# se pular, muda o estado
	elif(Input.is_action_just_pressed("pular")):
		get_parent().change_state("Jump")
	elif(Input.is_action_just_pressed("ataque_simples")):
		get_parent().change_state("Attack")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
