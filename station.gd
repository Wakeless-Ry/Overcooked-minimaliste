extends Node2D

# Liste des types de stations possibles
const Enum = preload("res://enum.gd")

# Type de cette station (choisi dans l’inspecteur)
@export var station_type: Enum.StationType = Enum.StationType.CRATE

var ingredient_scene = preload("res://ingredient.tscn")
# Liste de textures (visuel de la station)
@export var textures: Array[Texture2D] = []
var texture = null

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
			ingredient.adjust_size(50, ingredient_type)
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
		_:
			pass
