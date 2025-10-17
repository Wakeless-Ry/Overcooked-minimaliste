extends Node2D

const Enum = preload("res://enum.gd")
@export var textures: Array[Texture2D] = []
var texture = null
	
func choose_sprite(ingredient_type):
	match ingredient_type :
		Enum.Ingredient_type.BURGER :
			return textures[0]
		Enum.Ingredient_type.SOUP :
			return textures[1]
		Enum.Ingredient_type.SUSHI :
			return textures[2]
			
func adjust_size(size, other):
	var sprite = $Sprite2D
	if textures.size() > 0:
		texture = other
		sprite.texture = choose_sprite(other)
		sprite.position.x = 35
		sprite.position.y = 50
		var aspect_scale = size / sprite.texture.get_size().x
		sprite.scale = Vector2(aspect_scale, aspect_scale)
