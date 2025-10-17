#Recette.gd
class_name Recette
extends Resource

#name of the plat
@export var name: String = ""

#list of the steps to make the plate
@export var steps: Dictionary = {}

func _init(_name: String = "", _steps: Dictionary = {}):
	name = _name
	steps = _steps
	
