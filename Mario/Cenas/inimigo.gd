extends KinematicBody2D

var direcao = 1
var speed = 50
var gravity = 10



func _physics_process(delta):
	translate(Vector2(speed*direcao*delta, 0))


func _on_TimerPatrulha_timeout():
	direcao *= -1


func _on_AreaImpacto_body_entered(body):
	$Animacao.scale.y -= 0.5 * $Animacao.scale.y
	$Animacao.position.y *= -3
	$Colisao.disabled = true
	set_physics_process(false)
	body.velocity.y = body.jump_force
	$Timer.start()

func _on_Area2D_body_entered(body):
	if body is Player:
		body.die()


func _on_Timer_timeout():
	queue_free()
