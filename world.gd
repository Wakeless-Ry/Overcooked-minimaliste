extends Node2D

# Preload the square scene
var ingredient_scene = preload("res://ingredient.tscn")
var station_scene = preload("res://station.tscn")
var table_scene = preload("res://table.tscn")

var current_instructions = []

func _ready():
	spawn_new_instructions()

func spawn_new_instructions() -> void:
	for element in current_instructions:
		remove_child(element)
		
	var amount = (randi() % 6);
	
	var ingredients = spawn_elements(ingredient_scene, amount)
	var stations = spawn_elements(station_scene, amount)
	var table = spawn_element(table_scene)
	
	var instructions = []
	
	for i in range(amount + 1):
		instructions.append(ingredients[i])
		instructions.append(stations[i])
	
	instructions.append(table)
	
	$Cook.add_instructions(instructions)
	
func faire_list_top(instructions):
	var left = 600 - (36 * instructions.size()) / 2 
	for i in range(instructions.size()):
		var instruction = instructions[i]
		var top = instruction.duplicate()
		current_instructions.append(top)
		add_child(top)
		top.adjust_size(32., instruction.texture)
		top.position = Vector2(left + 36 * i, 24)
	
func spawn_elements(scene, amount) -> Array[Node2D]:
	var result : Array[Node2D] = []
	
	for i in range(amount + 1):
		result.append(spawn_element(scene))
	
	return result

func spawn_element(scene) -> Node2D:
	var element = scene.instantiate()
	var screen_size = get_viewport().get_visible_rect().size
	var random_position = Vector2(
		(randi() % int(screen_size.x - 200)) + 100,
		(randi() % int(screen_size.y - 200)) + 100
	)
	element.position = random_position
	
	add_child(element)
	
	return element
	
