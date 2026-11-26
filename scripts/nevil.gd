extends CharacterBody2D

const SPEED = 200.0
@onready var sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction_x := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down")
	var direction := Vector2(direction_x, direction_y).normalized()
	velocity = direction * SPEED
	move_and_slide()
	
	if direction == Vector2.ZERO:
		sprite.play("parado")
	elif abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			sprite.play("direita")
			sprite.flip_h = true
		else:
			sprite.play("esquerda")
			sprite.flip_h = false
	elif direction.y > 0:
		sprite.play("baixo")
	else:
		sprite.play("cima")
