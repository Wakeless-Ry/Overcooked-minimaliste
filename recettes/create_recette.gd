extends Node

func _ready():
	var recette_name = "soupe"
	
	var recette_ingredients = {
		"tomato": 3,
		"onion": 1,
		"potato": 2
	}
	var recette_steps = {
		["soupe_in_plate", "table"]: [["", "soupe_in_plate"]],
		
		["", "soupe_in_plate"]: [
			["tomato_cut", "table_cut"],
			["onion_cut", "table_cut"],
			["potato_cut", "table_cut"]
		],
		
		["tomato_cut", "table_cut"]: [["", "station_tomato"]],
		["onion_cut", "table_cut"]: [["", "station_onion"]],
		["potato_cut", "table_cut"]: [["", "station_potato"]],
		
		["", "station_tomato"]: [],
		["", "station_onion"]: [],
		["", "station_potato"]: []
	}
	

	var recette = Recette.new()
	recette.name = recette_name
	recette.ingredients = recette_ingredients
	recette.steps = recette_steps
	ResourceSaver.save(recette,"res://recettes/soupe.tres")
	print("Recette saved!")
	
	#var recette_name = "sushi"
#
	#var recette_ingredients = {
		#"rice": 1,
		#"fish": 1,
		#"cucumber": 1,
		#"nori": 1
	#}
#
	#var recette_steps = {
		#["sushi_in_plate", "table"]: [["", "sushi_in_plate"]],
		#
		#["", "sushi_in_plate"]: [
			#["cooked_rice", "table_cook"],
			#["fish_cut", "table_cut"],
			#["cucumber_cut", "table_cut"], 
			#["nori", "station_nori"]
		#],
		#
		#["cooked_rice", "caisse_rice"]: [["", "station_rice"]],
		#["cucumber_cut", "table_cut"]: [["", "station_cucumber"]],
		#["fish_cut", "table_cut"]: [["", "station_fish"]],
#
		#["", "station_rice"]: [],
		#["", "station_nori"]: [],
		#["", "station_fish"]: [],
		#["", "station_cucumber"]: []
	#}
	
	#var recette_name = "burger"
	#
	#var recette_ingredients = {
		#"beef": 1,
		#"bread": 2,
		#"lettuce": 1,
		#"tomato": 1
	#}
	#var recette_steps = {
		#["buger_in_plate", "table"]: [["", "buger_in_plate"]],
		#
		#["", "buger_in_plate"]: [
			#["cooked_beef", "table_cook"],
			#["tomate_cut", "table_cut"],
			#["lecttuce_cut", "table_cut"],
			#["chesse", "station_chesse"], 
			#["bread", "station_bread"]
		#],
		#
		#["cooked_beef", "table_cook"]: [["", "station_beef"]],
		#["cutted_lecttuce", "caisse_couper"]: [["", "station_lecttuce"]],
		#["cutted_tomate", "caisse_couper"]: [["", "station_tomate"]],
		#
		#["", "station_beef"]: [],
		#["", "station_bread"]: [],
		#["", "station_chesse"]: [],
		#["", "station_lecttuce"]: [],
		#["", "station_tomate"]: []
	#}
