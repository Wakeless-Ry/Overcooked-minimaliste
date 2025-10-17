extends Node2D

# Preload the square scene
const Enum = preload("res://enum.gd")
var station_scene = preload("res://station.tscn")
var cook_scene = preload("res://cook.tscn")
var objectif_scene = preload("res://objectif.tscn")

var cook = cook_scene.instantiate()

var kitchen = {}
var cook_inventory = ""
var recipes = [load("res://recettes/BURGER.tres"), load("res://recettes/SOUP.tres")]
var recipe = null

var objectif = null

func _process(delta):
	if recipe == null:
		recipe = recipes.pick_random()
	display()
	
	cook.give_environment(kitchen, cook_inventory, recipe)
	var action = cook.get_agent_action(delta)
	if action[0] == "deplacement":
		cook.position = action[1]
	else:
		cook_inventory = kitchen[action[1]].interact(cook_inventory)
		if action[1] == "DELIVERY_TABLE":
			recipe = recipes.pick_random()

func display():
	if objectif != null:
		remove_child(objectif)
	objectif = objectif_scene.instantiate()
	objectif.adjust_size(50, Enum.dictIngredient[recipe.name])
	add_child(objectif)

func _ready():	
	if station_scene == null:
		push_error("station_scene non assignée : glisse station.tscn dans l'inspecteur")
		return

	spawn_station("CUTTING_BOARD", Vector2(650, 100))
	spawn_station("DELIVERY_TABLE", Vector2(100, 300))
	#spawn_station("MIXING_STATION", Vector2(400, 500))
	spawn_station("OVEN", Vector2(200, 100))
	spawn_station("STOVE_PAN", Vector2(350, 100))
	spawn_station("STOVE_POT", Vector2(500, 100))
	spawn_station("PLATE", Vector2(400, 500))
	
	spawn_station("CRATE", Vector2(1000, 50), "BEEF")
	spawn_station("CRATE", Vector2(1000, 125), "TOMATO")
	spawn_station("CRATE", Vector2(1000, 200), "LETTUCE")
	spawn_station("CRATE", Vector2(1000, 275), "CHEESE")
	spawn_station("CRATE", Vector2(1000, 350), "BREAD")
	spawn_station("CRATE", Vector2(1000, 425), "CARROT")
	spawn_station("CRATE", Vector2(1000, 500), "POTATO")
	
	add_child(cook)
	
	kitchen["COOK"] = cook

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
