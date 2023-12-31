extends Node
@export var initial_state : State
var current_state: State
var states : Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	for hijo in get_children():
		if hijo is State:
			states[hijo.name.to_lower()] = hijo
			hijo.Trancision.connect(on_child_transition)
	if initial_state:
		initial_state.enter()
		current_state = initial_state

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_state:
		current_state.Update(delta)
	
func _physics_process(delta):
	if current_state: 
		current_state.Physics_Update(delta)

func on_child_transition(state, new_state_name):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	if current_state:
		current_state.exit()
	new_state.enter()
	current_state = new_state
