extends State

# aciona a animacao assim que inicia o estado
func enter():
	print("Estado -> attack")
	jogador.velocity.x = 0
	jogador.play_animation("attack")

func physics_update(delta):
	
	jogador.velocity.x = 0

func animation_finished():
	
	get_parent().change_state("Idle")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
