extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	var vel : Vector2 = (get_global_mouse_position() - global_position).normalized() * 1000
	velocity = vel
	move_and_slide()
