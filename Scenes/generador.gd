extends Node2D

var points = preload("res://Scenes/Area.tscn")

var timer := 0.0
var positions = [
	Vector2(160,100),
	Vector2(1200,200),
	Vector2(160,500),
	Vector2(1200,500),
	Vector2(600,300)
]


func _process(delta: float) -> void:
	timer += delta
	if timer >= 1.0:
		_spawn_points()
		timer = 0.0


func _spawn_points():
	var newPoint = points.instantiate()
	newPoint.global_position = positions.pick_random()
	get_parent().add_child(newPoint)
	
