extends Node2D

@export var speed = 200  # Movement speed in pixels per second
var instructions = []
var target_ingr = null

func _ready():
	position = Vector2(500, 500)
	
func _process(delta):
	if instructions.size() > 0:
		if !target_ingr:
			target_ingr = instructions.pop_front()
			
		var direction = (target_ingr.position - position).normalized()
		var distance = position.distance_to(target_ingr.position)
		var step = speed * delta

		if distance > step:
			position += direction * step
		else:
			position = target_ingr.position
		
		if distance < 64:
			get_parent().remove_child(target_ingr)
			target_ingr = null
	else:
		get_parent().spawn_new_instructions()

func add_instructions(instr_list):
	instructions = instr_list
