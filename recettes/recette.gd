#Recette.gd
class_name Recette
extends Resource

#name of the plat
@export var name: String = ""

#list of the ingredients
@export var ingredients: Dictionary = {}

#list of the steps to make the plate
@export var steps: Dictionary = {}

func _init(_name: String = "", _ingredients: Dictionary = {}, _steps: Dictionary = {}):
	name = _name
	ingredients = _ingredients
	steps = _steps
	
