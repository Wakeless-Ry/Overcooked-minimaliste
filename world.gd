extends Node2D

# Preload the square scene
const Enum = preload("res://enum.gd")
var station_scene = preload("res://station.tscn")
var cook_scene = preload("res://cook.tscn")
var objectif_scene = preload("res://objectif.tscn")

var cooks = []
var cooks_inventory = []

var nb_cooks = 2

var kitchen = {}
var recipes = [load("res://recettes/BURGER.tres"), load("res://recettes/SOUP.tres"),load("res://recettes/SUSHI.tres")]
var recipe = null;
var new_recipe = null;

var objectif = null;
var is_recipe_finished = false;
var has_generated_new_recipe = false;

func _process(delta):
	if recipe == null:
		#recipe.push_back(recipes.pick_random())
		recipe = recipes.pick_random()
	display()

	for i in range(nb_cooks):
		if i == 0:
			var new_kitchen = kitchen.duplicate()
			new_kitchen.erase("CUTTING_BOARD")
			new_kitchen.erase("CRATE_POTATO")
			new_kitchen.erase("CRATE_LETTUCE")
			new_kitchen.erase("CRATE_TOMATO")
			new_kitchen.erase("CRATE_FISH")
			new_kitchen.erase("CRATE_CUCUMBER")
			is_recipe_finished = cooks[i].give_environment(new_kitchen, cooks_inventory[i], recipe)
			if (is_recipe_finished && !has_generated_new_recipe):
				new_recipe = recipes.pick_random()
				has_generated_new_recipe = true
		else:
			var new_kitchen = kitchen.duplicate()
			new_kitchen.erase("STOVE_PAN")
			new_kitchen.erase("DELIVERY_TABLE")
			new_kitchen.erase("CRATE_CHEESE")
			new_kitchen.erase("CRATE_BEEF")
			new_kitchen.erase("CRATE_BREAD")
			new_kitchen.erase("CRATE_RICE")
			new_kitchen.erase("CRATE_NORI")
			if is_recipe_finished:
				cooks[i].give_environment(new_kitchen, cooks_inventory[i], new_recipe)
			else:
				cooks[i].give_environment(new_kitchen, cooks_inventory[i], recipe)
		
		var action = cooks[i].get_agent_action(delta)
		
		match action[0]:
			"deplacement":
				cooks[i].position = action[1]
			"interagir":
				cooks_inventory[i] = kitchen[action[1]].interact(cooks_inventory[i])
				if action[1] == "DELIVERY_TABLE":
					cooks_inventory[i] = ""
					recipe = new_recipe
					is_recipe_finished = false
					has_generated_new_recipe = false
					#for j in range(nb_cooks):
						#cooks_inventory[j] = ""

func display():
	if objectif != null:
		remove_child(objectif)
	objectif = objectif_scene.instantiate()
	objectif.adjust_size(50, Enum.dictIngredient[recipe.name])
	if new_recipe != null:
		objectif.adjust_size(50, Enum.dictIngredient[new_recipe.name])
	add_child(objectif)

func _ready():
	spawn_station("DELIVERY_TABLE", Vector2(100, 300))
	
	spawn_station("STOVE_PAN", Vector2(350, 100))
	
	spawn_station("CRATE", Vector2(150, 600), "NORI")
	spawn_station("CRATE", Vector2(250, 600), "CHEESE")
	spawn_station("CRATE", Vector2(350, 600), "BEEF")
	spawn_station("CRATE", Vector2(450, 600), "BREAD")
	spawn_station("CRATE", Vector2(550, 600), "RICE")
	
	spawn_station("STOVE_POT", Vector2(576, 216))
	spawn_station("PLATE", Vector2(576, 432))
	
	spawn_station("CUTTING_BOARD", Vector2(800, 100))
	
	spawn_station("CRATE", Vector2(700, 600), "TOMATO")
	spawn_station("CRATE", Vector2(800, 600), "LETTUCE")
	spawn_station("CRATE", Vector2(900, 600), "POTATO")
	
	spawn_station("CRATE", Vector2(1000, 600), "FISH")
	spawn_station("CRATE", Vector2(1100, 600), "CUCUMBER")
	
	#spawn_station("OVEN", Vector2(200, 100))
	#spawn_station("CRATE", Vector2(1000, 425), "CARROT")
	
	for i in range(nb_cooks):
		var cook = cook_scene.instantiate()
		cook.position = Vector2(300 + 500*i, 300)
		add_child(cook)
		cooks.push_back(cook)
		cooks_inventory.push_back("")
		kitchen["COOK" + str(i)] = cook

func spawn_station(station_type: String, pos: Vector2, secondary = null):
	var station = station_scene.instantiate()
	add_child(station)
	station.position = pos
	var station_key = station_type
	if secondary != null:
		station_key += "_" + secondary
	kitchen[station_key] = station

	match station_type:
		"DELIVERY_TABLE":
			station.station_type = Enum.StationType.DELIVERY_TABLE
		"MIXING_STATION":
			station.station_type = Enum.StationType.MIXING_STATION
		"OVEN":
			station.station_type = Enum.StationType.OVEN
		"STOVE_PAN":
			station.station_type = Enum.StationType.STOVE_PAN
		"STOVE_POT":
			station.station_type = Enum.StationType.STOVE_POT
		"CRATE":
			station.station_type = Enum.StationType.CRATE
			station.content = secondary
		"CUTTING_BOARD":
			station.station_type = Enum.StationType.CUTTING_BOARD
		"PLATE":
			station.station_type = Enum.StationType.PLATE
			
	station.update_sprite(secondary)
