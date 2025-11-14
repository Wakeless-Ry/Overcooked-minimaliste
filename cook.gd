extends Node2D

var ingredient_scene = preload("res://ingredient.tscn")
const Enum = preload("res://enum.gd")

@export var speed = 400  # Movement speed in pixels per second
var instructions = []
var target_ingr = null
var state

# world environnment
var kitchen
var inventory
var recipe
var recipe_name

var ingredient

func _ready():
	position = Vector2(500, 500)

func add_instructions(instr_list):
	instructions = instr_list

func is_possible(step):
	if step[0] != inventory:
		return false
	if !kitchen.has(step[1]):
		return false
	if step[1] == "PLATE" || step[1] == "STOVE_POT":
		return (step.size() > 2 && kitchen[step[1]].has_inventory(step[2])) || (step[0] != "" && kitchen[step[1]].needs_ingredient(recipe_name, step[0]))
	return true

func get_next_step(arbre: Dictionary, racine):
	var parcours: Array = [racine]
	while parcours.size() != 0:
		parcours = parcours.filter(check_plate)
		var current = parcours.pop_front()
		if is_possible(current):
			return current
		if arbre.has(current):
			parcours.append_array(arbre[current])

func check_plate(step):
	if (step[1] == "PLATE" || step[1] == "STOVE_POT") && step[0] != "":
		return kitchen[step[1]].needs_ingredient(recipe_name, step[0])
	return true

func give_environment(kitchen_env, inventory_env, recipe_env):
	var old = inventory
	kitchen = kitchen_env
	inventory = inventory_env
	recipe = recipe_env.steps
	recipe_name = recipe_env.name
	var current = get_next_step(recipe, recipe["OBJECTIVE"])
	state = current[1]
	
	if ingredient != null:
		ingredient.position = Vector2(-100, 0)
		if (inventory != old):
			remove_child(ingredient)
			ingredient = null
	
	if (inventory != "" && inventory != old) && ingredient == null:
		ingredient = ingredient_scene.instantiate()
		add_child(ingredient)
		ingredient.adjust_size(150, Enum.dictIngredient[inventory])
		

func get_agent_action(delta):
	var direction = (kitchen[state].position - position).normalized()
	var distance = position.distance_to(kitchen[state].position)
	var step = speed * delta

	if direction.x >= 0:
		self.flip_h = true
	elif direction.x < 0:
		self.flip_h = false

	if position == kitchen[state].position:
		return ["interagir", state]
		
	if distance > step:
		return ["deplacement", position + direction * step]
	else:
		return ["deplacement", kitchen[state].position]
