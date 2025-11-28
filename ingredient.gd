extends Node2D

const Enum = preload("res://enum.gd")
@export var textures: Array[Texture2D] = []
var texture = null
	
func choose_sprite(ingredient_type):
	match ingredient_type :
		Enum.Ingredient_type.BEEF :
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
		Enum.Ingredient_type.COOKED_BEEF :
			return textures[10]
		Enum.Ingredient_type.LETTUCE_CUT :
			return textures[11]
		Enum.Ingredient_type.TOMATO_CUT :
			return textures[12]
		Enum.Ingredient_type.POTATO_CUT :
			return textures[13]
		Enum.Ingredient_type.RICE :
			return textures[14]
		Enum.Ingredient_type.COOKED_RICE :
			return textures[15]
		Enum.Ingredient_type.NORI :
			return textures[16]
		Enum.Ingredient_type.FISH :
			return textures[17]
		Enum.Ingredient_type.CUCUMBER :
			return textures[18]
		Enum.Ingredient_type.FISH_CUT :
			return textures[19]
		Enum.Ingredient_type.CUCUMBER_CUT :
			return textures[20]
	
func adjust_size(size, other):
	var sprite = $Sprite2D
	if textures.size() > 0:
		texture = other
		sprite.texture = choose_sprite(other)
		var aspect_scale = size / sprite.texture.get_size().x
		sprite.scale = Vector2(aspect_scale, aspect_scale)
