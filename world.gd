extends Node2D

# Preload the square scene
const Enum = preload("res://enum.gd")
var station_scene = preload("res://station.tscn")
var cook_scene = preload("res://cook.tscn")
var objectif_scene = preload("res://objectif.tscn")

var nombre_recette = 0
var time_start = 0
var time_now = 0

var cooks = []
var cooks_inventory = []

var nb_cooks = 4

var kitchen = {}
var recipes = [load("res://recettes/BURGER.tres"), load("res://recettes/SOUP.tres"),load("res://recettes/SUSHI.tres")]
var recipe = null
var old_recipe = null;
var is_recipe_finished = false;
var has_generated_new_recipe = false;
var nb_cook_finish_recette;


var objectif = null

func _process(delta):
	time_now = Time.get_unix_time_from_system()
	var time_elapsed = time_now - time_start
	var nb_recette_minute = 0
	if time_elapsed != 0 :
		nb_recette_minute = (60 * nombre_recette) / time_elapsed 
	$Label.text = "Nombres de recettes réalisées : " + str(nombre_recette) + "\n" 
	$Label.text +="Nb de recettes réalisées par minute : " + str(nb_recette_minute).pad_decimals(2) + "\n"
	$Label.text +="Temps écoulé : " + str(time_elapsed).pad_decimals(2) + "s"

	if recipe == null:
		recipe = recipes.pick_random()
	display()
	
	var current_recette
	for i in range(nb_cooks):
		current_recette = recipe
		if(i == nb_cook_finish_recette && has_generated_new_recipe):
			current_recette = old_recipe
		if nb_cooks ==1: 
			cooks[i].give_environment(kitchen, cooks_inventory[i], current_recette)
		elif nb_cooks == 2:
			if i == 0 :
				var new_kitchen = kitchen.duplicate()
				new_kitchen.erase("CUTTING_BOARD")
				new_kitchen.erase("CRATE_POTATO")
				new_kitchen.erase("CRATE_LETTUCE")
				new_kitchen.erase("CRATE_TOMATO")
				new_kitchen.erase("CRATE_FISH")
				new_kitchen.erase("CRATE_CUCUMBER")
				is_recipe_finished = cooks[i].give_environment(new_kitchen, cooks_inventory[i], current_recette)
			else:
				var new_kitchen = kitchen.duplicate()
				new_kitchen.erase("STOVE_PAN")
				new_kitchen.erase("DELIVERY_TABLE")
				new_kitchen.erase("CRATE_CHEESE")
				new_kitchen.erase("CRATE_BEEF")
				new_kitchen.erase("CRATE_BREAD")
				new_kitchen.erase("CRATE_RICE")
				new_kitchen.erase("CRATE_NORI")
				is_recipe_finished = cooks[i].give_environment(new_kitchen, cooks_inventory[i], current_recette)
		elif nb_cooks == 3:
			if i == 0 :
				var new_kitchen = kitchen.duplicate()
				new_kitchen.erase("CUTTING_BOARD")
				new_kitchen.erase("CRATE_POTATO")
				new_kitchen.erase("CRATE_LETTUCE")
				new_kitchen.erase("CRATE_TOMATO")
				new_kitchen.erase("CRATE_FISH")
				new_kitchen.erase("CRATE_CUCUMBER")
				new_kitchen.erase("DELIVERY_TABLE")
				new_kitchen.erase("CRATE_RICE")
				new_kitchen.erase("CRATE_BREAD")
				new_kitchen.erase("CRATE_POTATO")
				is_recipe_finished = cooks[i].give_environment(new_kitchen, cooks_inventory[i], current_recette)
			elif i == 1:
				var new_kitchen = kitchen.duplicate()
				new_kitchen.erase("STOVE_PAN")
				new_kitchen.erase("DELIVERY_TABLE")
				new_kitchen.erase("CRATE_CHEESE")
				new_kitchen.erase("CRATE_BEEF")
				new_kitchen.erase("CRATE_BREAD")
				new_kitchen.erase("CRATE_RICE")
				new_kitchen.erase("CRATE_NORI")
				new_kitchen.erase("CRATE_POTATO")
				is_recipe_finished = cooks[i].give_environment(new_kitchen, cooks_inventory[i], current_recette)
			else :
				var new_kitchen = kitchen.duplicate()
				new_kitchen.erase("CRATE_NORI")
				new_kitchen.erase("CRATE_BEEF")
				new_kitchen.erase("CRATE_CHEESE")
				new_kitchen.erase("CRATE_LETTUCE")
				new_kitchen.erase("CRATE_TOMATO")
				new_kitchen.erase("CRATE_FISH")
				new_kitchen.erase("CRATE_CUCUMBER")
				is_recipe_finished = cooks[i].give_environment(new_kitchen, cooks_inventory[i], current_recette)
		else: # pour les quatres 
			if i == 0 :
				var new_kitchen = kitchen.duplicate()
				new_kitchen.erase("CUTTING_BOARD")
				new_kitchen.erase("CRATE_POTATO")
				new_kitchen.erase("CRATE_LETTUCE")
				new_kitchen.erase("CRATE_TOMATO")
				new_kitchen.erase("CRATE_FISH")
				new_kitchen.erase("CRATE_CUCUMBER")
				new_kitchen.erase("DELIVERY_TABLE")
				new_kitchen.erase("CRATE_RICE")
				new_kitchen.erase("CRATE_BREAD")
				new_kitchen.erase("CRATE_POTATO")
				is_recipe_finished = cooks[i].give_environment(new_kitchen, cooks_inventory[i], current_recette)
			elif i == 1:
				var new_kitchen = kitchen.duplicate()
				new_kitchen.erase("STOVE_PAN")
				new_kitchen.erase("DELIVERY_TABLE")
				new_kitchen.erase("CRATE_CHEESE")
				new_kitchen.erase("CRATE_BEEF")
				new_kitchen.erase("CRATE_BREAD")
				new_kitchen.erase("CRATE_RICE")
				new_kitchen.erase("CRATE_NORI")
				new_kitchen.erase("CRATE_POTATO")
				new_kitchen.erase("CRATE_CUCUMBER")
				is_recipe_finished = cooks[i].give_environment(new_kitchen, cooks_inventory[i], current_recette)
			elif i == 2 :
				var new_kitchen = kitchen.duplicate()
				new_kitchen.erase("CRATE_NORI")
				new_kitchen.erase("CRATE_BEEF")
				new_kitchen.erase("CRATE_CHEESE")
				new_kitchen.erase("CRATE_LETTUCE")
				new_kitchen.erase("CRATE_TOMATO")
				new_kitchen.erase("CRATE_FISH")
				new_kitchen.erase("CRATE_CUCUMBER")
				is_recipe_finished = cooks[i].give_environment(new_kitchen, cooks_inventory[i], current_recette)
			else:
				var new_kitchen = kitchen.duplicate()
				new_kitchen.erase("CRATE_NORI")
				new_kitchen.erase("CRATE_BEEF")
				new_kitchen.erase("CRATE_CHEESE")
				new_kitchen.erase("CRATE_BREAD")
				new_kitchen.erase("CRATE_LETTUCE")
				new_kitchen.erase("CRATE_TOMATO")
				new_kitchen.erase("CRATE_FISH")
				new_kitchen.erase("CRATE_RICE")
				new_kitchen.erase("CRATE_POTATO")
				new_kitchen.erase("DELIVERY_TABLE")
				is_recipe_finished = cooks[i].give_environment(new_kitchen, cooks_inventory[i], current_recette)

		var action = cooks[i].get_agent_action(delta)
		
		if(is_recipe_finished && has_generated_new_recipe == false):
			nb_cook_finish_recette = i
			old_recipe = recipe
			recipe = recipes.pick_random()
			has_generated_new_recipe = true
		
		match action[0]:
			"deplacement":
				cooks[i].position = action[1]
			"interagir":
				cooks_inventory[i] = kitchen[action[1]].interact(cooks_inventory[i])
				if action[1] == "DELIVERY_TABLE":
					cooks_inventory[i] = ""
					nombre_recette +=1
					is_recipe_finished = false
					has_generated_new_recipe = false


func display():
	if objectif != null:
		remove_child(objectif)
	objectif = objectif_scene.instantiate()
	objectif.adjust_size(50, Enum.dictIngredient[recipe.name])
	add_child(objectif)


func _ready():
	$Label.text = "Nombres de recettes réalisées : " + str(nombre_recette)
	$Label.position = Vector2(750,2)
	time_start = Time.get_unix_time_from_system()

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
		if nb_cooks == 3:
			cook.position = Vector2(300 + 250*i, 300)
		elif nb_cooks == 4:
			cook.position = Vector2(300 + 125*i, 300)
		else: 
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
