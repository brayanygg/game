extends Node
@export var initial_state : State
var current_state: State
var states : Dictionary = {}
# Si van a meter mano aqui avissen que apenas yo lo entiendo XDDDDD
# Called when the node enters the scene tree for the first time.
func _ready():
	#obtiene todos los estados que estan como nodos hijos
	for hijo in get_children(): 
		if hijo is State:
			states[hijo.name.to_lower()] = hijo # agrega a un dicionario el estado
			hijo.Trancision.connect(on_child_transition)# conecta la señal del estado
	if initial_state:
		initial_state.enter()
		current_state = initial_state 
		#Iniciamos el state actual que se guardara en current_state
		# asi simplemente llamamos las funciones de el y vamos variando que estado tiene
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_state:
		current_state.Update(delta)
	
func _physics_process(delta):
	if current_state: 
		current_state.Physics_Update(delta)

func on_child_transition(state, new_state_name):
	if state != current_state: # comprueba que el state de donde viene la señal sea el actual
		#simplemente para prevenir fallos
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state: # comprueba que no esta vacio(valor = null)
		return
	if current_state:
		current_state.exit()
	new_state.enter()
	current_state = new_state
