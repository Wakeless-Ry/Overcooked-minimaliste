extends Node2D

# Preload the square scene
const Enum = preload("res://enum.gd")
var station_scene = preload("res://station.tscn")
var cook_scene = preload("res://cook.tscn")

var cook = cook_scene.instantiate()

var kitchen = {}
var cook_inventory = ""
var recipe = {
	["PLATE_BURGER", "TABLE"]: [["", "PLATE_BURGER"]],
	["", "PLATE_BURGER"]: [["COOKED_BEEF", "ASSIETTE"], ["CUT_TOMATO", "ASSIETTE"], ["CUT_LETTUCE", "ASSIETTE"], ["CHEESE", "ASSIETTE"], ["BREAD", "ASSIETTE"]],
	["COOKED_BEEF", "ASSIETTE"]: [["BEEF", "CRATE_CASSEROLE"]],
	["CUT_LETTUCE", "ASSIETTE"]: [["LETTUCE", "CUTTING_BOARD"]],
	["CUT_TOMATO", "ASSIETTE"]: [["TOMATO", "CUTTING_BOARD"]],
	["CHEESE", "ASSIETTE"]: [["", "CRATE_CHEESE"]],
	["BREAD", "ASSIETTE"]: [["", "CRATE_BREAD"]],
	["BEEF", "CRATE_CASSEROLE"]: [["", "CRATE_BEEF"]],
	["LETTUCE", "CUTTING_BOARD"]: [["", "CRATE_LETTUCE"]],
	["TOMATO", "CUTTING_BOARD"]: [["", "CRATE_TOMATO"]]
}


func _process(delta):
	cook.give_environment(kitchen, cook_inventory, recipe)
	var action = cook.get_agent_action(delta)
	if action[0] == "deplacement":
		cook.position = action[1]
	else:
		cook_inventory = action[1].interact(cook_inventory)
	pass
	
#todo affichage
#func display():
	#var display_final = []
	#var tmp = []
	#var parcours = recipe[0]
	#while parcours.size() != 0:
		#var current = parcours.pop_front()
		#if recipe.has(current):
			#tmp.push_back(current)
			#parcours.append_array(recipe[current])
		#else:
			#tmp.reverse()
			#for elt in tmp:
				#display_final.insert(0, elt)
			#tmp.clear()

func _ready():
	add_child(cook)
	
	if station_scene == null:
		push_error("station_scene non assignée : glisse station.tscn dans l'inspecteur")
		return

	spawn_station("CUTTING_BOARD", Vector2(650, 100))
	spawn_station("DELIVERY_TABLE", Vector2(100, 300))
	spawn_station("MIXING_STATION", Vector2(400, 500))
	spawn_station("OVEN", Vector2(200, 100))
	spawn_station("STOVE_PAN", Vector2(350, 100))
	spawn_station("STOVE_POT", Vector2(500, 100))
	
	spawn_station("CRATE", Vector2(1000, 100), Enum.Ingredient_type.HAM)
	spawn_station("CRATE", Vector2(1000, 500), Enum.Ingredient_type.APPLE)
	spawn_station("CRATE", Vector2(1000, 200), Enum.Ingredient_type.LETTUCE)
	spawn_station("CRATE", Vector2(1000, 300), Enum.Ingredient_type.CHEESE)
	spawn_station("CRATE", Vector2(1000, 400), Enum.Ingredient_type.CARROT)
	
	kitchen["COOK"] = cook

func spawn_station(station_type: String, pos: Vector2, secondary = null):
	var station = station_scene.instantiate()
	add_child(station)
	station.position = pos
	kitchen[station_type] = station

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
		"CUTTING_BOARD":
			station.station_type = Enum.StationType.CUTTING_BOARD
			
	station.update_sprite(secondary)
