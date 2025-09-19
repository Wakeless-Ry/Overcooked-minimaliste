extends Node2D

@export var textures: Array[Texture2D] = []
var texture = null

func _ready():
	adjust_size(32., textures[randi() % textures.size()])
	
func adjust_size(size, other):
	var sprite = $Sprite2D
	if textures.size() > 0:
		texture = other
		sprite.texture = other
		var aspect_scale = size / sprite.texture.get_size().x
		sprite.scale = Vector2(aspect_scale, aspect_scale)
