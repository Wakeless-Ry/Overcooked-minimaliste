extends Node

func _ready():
	var recette_name_soupe = "SOUP"
	
	var recette_steps_soupe = {
		"OBJECTIVE": ["SOUP", "DELIVERY_TABLE"],
		["SOUP", "DELIVERY_TABLE"]: [["", "STOVE_POT", ["TOMATO_CUT", "LETTUCE_CUT", "POTATO_CUT"]]],
		
		["", "STOVE_POT", ["TOMATO_CUT", "LETTUCE_CUT", "POTATO_CUT"]]: [
			["TOMATO_CUT", "STOVE_POT"],
			["LETTUCE_CUT", "STOVE_POT"],
			["POTATO_CUT", "STOVE_POT"]
		],
		
		["TOMATO_CUT", "STOVE_POT"]: [["", "TOMATO_CUT"]],
		["", "TOMATO_CUT"]: [["TOMATO", "CUTTING_BOARD"]],
		
		["LETTUCE_CUT", "STOVE_POT"]: [["", "LETTUCE_CUT"]],
		["", "LETTUCE_CUT"]: [["LETTUCE", "CUTTING_BOARD"]],
		
		["POTATO_CUT", "STOVE_POT"]: [["", "POTATO_CUT"]],
		["", "POTATO_CUT"]: [["POTATO", "CUTTING_BOARD"]],
		
		["TOMATO", "CUTTING_BOARD"]: [["", "CRATE_TOMATO"]],
		["LETTUCE", "CUTTING_BOARD"]: [["", "CRATE_LETTUCE"]],
		["POTATO", "CUTTING_BOARD"]: [["", "CRATE_POTATO"]],
	}
	
	var recette_name_burger = "BURGER"
	
	var recette_steps_burger = {
		"OBJECTIVE": ["BURGER", "DELIVERY_TABLE"],
		["BURGER", "DELIVERY_TABLE"]: [["", "PLATE", ["BREAD", "BREAD", "COOKED_BEEF", "TOMATO_CUT", "LETTUCE_CUT", "CHEESE"]]],
		
		["", "PLATE", ["BREAD", "BREAD", "COOKED_BEEF", "TOMATO_CUT", "LETTUCE_CUT", "CHEESE"]]: [
			["BREAD", "PLATE"],
			["COOKED_BEEF", "PLATE"],
			["TOMATO_CUT", "PLATE"],
			["LETTUCE_CUT", "PLATE"],
			["CHEESE", "PLATE"],
		],
		
		["COOKED_BEEF", "PLATE"]: [["", "COOKED_BEEF"]],
		["", "COOKED_BEEF"]: [["BEEF", "STOVE_PAN"]],
		
		["TOMATO_CUT", "PLATE"]: [["", "TOMATO_CUT"]],
		["", "TOMATO_CUT"]: [["TOMATO", "CUTTING_BOARD"]],
		
		["LETTUCE_CUT", "PLATE"]: [["", "LETTUCE_CUT"]],
		["", "LETTUCE_CUT"]: [["LETTUCE", "CUTTING_BOARD"]],
		
		["BEEF", "STOVE_PAN"]: [["", "CRATE_BEEF"]],
		["TOMATO", "CUTTING_BOARD"]: [["", "CRATE_TOMATO"]],
		["LETTUCE", "CUTTING_BOARD"]: [["", "CRATE_LETTUCE"]],
		["CHEESE", "PLATE"]: [["", "CRATE_CHEESE"]],
		["BREAD", "PLATE"]: [["", "CRATE_BREAD"]],
	}
	
	var recette_name_sushi = "sushi"
	
	var recette_steps_sushi = {
		["sushi_in_plate", "table"]: [["", "sushi_in_plate"]],
		
		["", "sushi_in_plate"]: [
			["cooked_rice", "table_cook"],
			["fish_cut", "table_cut"],
			["cucumber_cut", "table_cut"], 
			["nori", "station_nori"]
		],
		
		["cooked_rice", "caisse_rice"]: [["", "station_rice"]],
		["cucumber_cut", "table_cut"]: [["", "station_cucumber"]],
		["fish_cut", "table_cut"]: [["", "station_fish"]],

		["", "station_rice"]: [],
		["", "station_nori"]: [],
		["", "station_fish"]: [],
		["", "station_cucumber"]: []
	}

	var recette = Recette.new()
	recette.name = recette_name_soupe
	recette.steps = recette_steps_soupe
	ResourceSaver.save(recette,"res://recettes/" + recette_name_soupe + ".tres")
	print("Recette saved: " + recette_name_soupe)
	
	recette.name = recette_name_burger
	recette.steps = recette_steps_burger
	ResourceSaver.save(recette,"res://recettes/" + recette_name_burger + ".tres")
	print("Recette saved: " + recette_name_burger)
	
	recette.name = recette_name_sushi
	recette.steps = recette_steps_sushi
	ResourceSaver.save(recette,"res://recettes/" + recette_name_sushi + ".tres")
	print("Recette saved: " + recette_name_sushi)
