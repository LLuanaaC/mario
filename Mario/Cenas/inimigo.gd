extends KinematicBody2D

var direcao = 1
var speed = 50
var gravity = 10



func _physics_process(delta):
	translate(Vector2(speed*direcao*delta, 0))


func _on_TimerPatrulha_timeout():
	direcao *= -1


func _on_AreaImpacto_body_entered(body):
	$Animacao.play("amassado")
	queue_free()
	



func _on_Area2D_body_entered(body):
	if body is Player:
		body.die()
