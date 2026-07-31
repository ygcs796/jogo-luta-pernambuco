extends Node

var current_state: State

@onready var jogador = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for child in get_children(): # recebe uma lista dos filhos de StateMachine
		if(child is State): # verifica se o filho (Ex: Idle) herda de State
			child.jogador = jogador
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func change_state(state_name: String):
	
	# encerra o estado atual para comecar o proximo
	if(current_state):
		current_state.exit()
	
	# guarda o proximo estado em next_state
	var next_state := get_node_or_null(state_name)
	
	# em caso de erro
	if(next_state == null):
		push_error("Estado '%s' não encontrado" % state_name)
		return
	
	current_state = next_state
	
	# finaliza a mudanca de estado
	current_state.enter()

func physics_update(delta):
	
	if(current_state):
		current_state.physics_update(delta)
