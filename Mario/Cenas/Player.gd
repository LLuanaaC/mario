extends KinematicBody2D
class_name Player

export var gravity = 10
export var walk_speed = 150
export var jump_force = -250
export var velocity = Vector2()
export var can_double_jump = true
export var coins = 0
signal morreu


func _physics_process(delta):
	var mov_horizontal = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = mov_horizontal * walk_speed
	
	if is_on_floor():
		if abs(velocity.x) > 0:
			$Animacao.play("walk")
		else:
			$Animacao.play("idle")
	else:
		$Animacao.play("jump")
	if velocity.x > 0:
		$Animacao.flip_h = false
	elif velocity.x < 0:
		$Animacao.flip_h = true
	
	if is_on_ceiling():
		velocity.y = 0
	if is_on_floor():
		can_double_jump = true
	if not is_on_floor():
		velocity.y += gravity
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_force
		$Animacao.play()
	elif can_double_jump and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_force
		can_double_jump = false
		$Animacao.play()
		
	move_and_slide(velocity, Vector2.UP)


func _on_Notificador_screen_exited():
	emit_signal("morreu")

func die():
	$AnimationPlayer.play("morte")
	
func volta():
	position.x = 201
	position.y = 346
