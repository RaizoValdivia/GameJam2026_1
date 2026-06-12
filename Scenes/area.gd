extends Area2D

var player

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("Colisionando")
		queue_free()
