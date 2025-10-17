extends Node2D

# Liste des types de stations possibles
const Enum = preload("res://enum.gd")

# Type de cette station (choisi dans l’inspecteur)
@export var station_type: Enum.StationType = Enum.StationType.CRATE

var ingredient_scene = preload("res://ingredient.tscn")
# Liste de textures (visuel de la station)
@export var textures: Array[Texture2D] = []
var texture = null
var content = null
var inventory = []

var ingrDict = {
	"BURGER" : ["BREAD", "COOKED_BEEF", "LETTUCE_CUT", "CHEESE", "TOMATO_CUT"]
}

func _ready():
	#il faut set un sprite dépendant du type de station, et si c'est une caisse, d'une caisse de ressource
	# avec une photo de l'ingrédient
	pass

# Ajuste la taille de la texture
func adjust_size(size, other):
	var sprite = $Sprite2D
	texture = other
	sprite.texture = other
	var aspect_scale = size / sprite.texture.get_size().x
	sprite.scale = Vector2(aspect_scale, aspect_scale)
			
func update_sprite(ingredient_type):
	match station_type:
		Enum.StationType.CRATE:
			adjust_size(75, textures[3])
			var ingredient = ingredient_scene.instantiate()
			ingredient.adjust_size(50, Enum.dictIngredient[ingredient_type])
			add_child(ingredient)
		Enum.StationType.CUTTING_BOARD:
			adjust_size(75, textures[2])
		Enum.StationType.STOVE_PAN:
			adjust_size(75, textures[5])
		Enum.StationType.STOVE_POT:
			adjust_size(75, textures[1])
		Enum.StationType.OVEN:
			adjust_size(75, textures[0])
		Enum.StationType.MIXING_STATION:
			adjust_size(75, textures[4])
		Enum.StationType.DELIVERY_TABLE:
			adjust_size(75, textures[4])
		Enum.StationType.PLATE:
			adjust_size(50, textures[6])
		_:
			pass

func interact(item):
	print("=====================================")
	match station_type:
		Enum.StationType.CRATE:
			if item == "":
				return content
		Enum.StationType.CUTTING_BOARD:
			match item:
				"LETTUCE":
					return "LETTUCE_CUT"
				"TOMATO":
					return "TOMATO_CUT"
		Enum.StationType.STOVE_PAN:
			match item:
				"BEEF":
					return "COOKED_BEEF"
		Enum.StationType.STOVE_POT:
			pass
		Enum.StationType.OVEN:
			pass
		Enum.StationType.MIXING_STATION:
			pass
		Enum.StationType.DELIVERY_TABLE:
			pass
		Enum.StationType.PLATE:
			inventory.append(item)
			return plate_recipe()
		_:
			pass
	return ""
		
func plate_recipe():
	if lists_have_same_items_with_counts(inventory, ["BREAD", "COOKED_BEEF", "LETTUCE_CUT", "CHEESE", "TOMATO_CUT"]):
		inventory = []
		return "BURGER"
	return ""

func has_inventory(other):
	return lists_have_same_items_with_counts(inventory, other)

func needs_ingredient(recipe_name, ingr):
	return !inventory.has(ingr) && ingrDict[recipe_name].has(ingr)
	
func lists_have_same_items_with_counts(list1, list2) -> bool:
	if list1.size() != list2.size():
		return false

	var counts1 = {}
	var counts2 = {}

	# Count items in list1
	for item in list1:
		counts1[item] = counts1.get(item, 0) + 1

	# Count items in list2
	for item in list2:
		counts2[item] = counts2.get(item, 0) + 1

	# Compare counts dictionaries
	return counts1 == counts2
