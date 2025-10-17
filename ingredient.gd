extends Node2D

const Enum = preload("res://enum.gd")
@export var textures: Array[Texture2D] = []
var texture = null
	
func choose_sprite(ingredient_type):
	match ingredient_type :
		Enum.Ingredient_type.HAM :
			return textures[0]
		Enum.Ingredient_type.TOMATO :
			return textures[1]
		Enum.Ingredient_type.LETTUCE :
			return textures[2]
		Enum.Ingredient_type.CHEESE :
			return textures[3]
		Enum.Ingredient_type.CARROT :
			return textures[4]
		Enum.Ingredient_type.BREAD :
			return textures[5]
		Enum.Ingredient_type.POTATO :
			return textures[6]
		Enum.Ingredient_type.BURGER :
			return textures[7]
		Enum.Ingredient_type.SOUP :
			return textures[8]
		Enum.Ingredient_type.SUSHI :
			return textures[9]
	
func adjust_size(size, other):
	var sprite = $Sprite2D
	if textures.size() > 0:
		texture = other
		sprite.texture = choose_sprite(other)
		var aspect_scale = size / sprite.texture.get_size().x
		sprite.scale = Vector2(aspect_scale, aspect_scale)
