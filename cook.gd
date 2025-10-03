extends Node2D

@export var speed = 200  # Movement speed in pixels per second
var instructions = []
var target_ingr = null
var state

# world environnment
var kitchen
var inventory
var recipe

func _ready():
	position = Vector2(500, 500)

func add_instructions(instr_list):
	instructions = instr_list

func is_possible(step):
	if step[0] != inventory:
		return false
	if !kitchen.has(step[1]):
		return false
	return true

func get_next_step(arbre: Dictionary, racine):
	var parcours: Array = [racine]
	while parcours.size() != 0:
		var current = parcours.pop_front()
		if is_possible(current):
			return current
		if arbre.has(current):
			parcours.append_array(arbre[current])

func give_environment(kitchen_env, inventory_env, recipe_env):
	kitchen = kitchen_env
	inventory = inventory_env
	recipe = recipe_env
	
	state = get_next_step(recipe.arbre, recipe.racine)[1]

func get_agent_action(delta):
	var direction = (state.position - position).normalized()
	var distance = position.distance_to(state.position)
	var step = speed * delta

	if position == state.position:
		return ["interagir", state]
		
	if distance > step:
		return ["deplacement", position + direction * step]
	else:
		return ["deplacement", state.position]
