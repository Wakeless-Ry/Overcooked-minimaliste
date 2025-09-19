extends Node2D

var texture = null

func _ready():
	adjust_size(128., null)
	
func adjust_size(size, _other):
	var sprite = $Sprite2D
	var aspect_scale = size / sprite.texture.get_size().x
	sprite.scale = Vector2(aspect_scale, aspect_scale)
