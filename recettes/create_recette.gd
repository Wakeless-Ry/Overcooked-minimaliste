extends Node

func _ready():
	
	
	var recette_name = "sushi"

	var recette_ingredients = {
		"rice": 1,
		"fish": 1,
		"cucumber": 1,
		"nori": 1
	}

	var recette_steps = {
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

	var sushi_recette = Recette.new()
	sushi_recette.name = recette_name
	sushi_recette.ingredients = recette_ingredients
	sushi_recette.steps = recette_steps
	ResourceSaver.save(sushi_recette,"res://recettes/sushi.tres")
	print("Sushi recette saved!")
