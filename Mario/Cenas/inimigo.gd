extends KinematicBody2D

var direcao = 1
var speed = 50



func _physics_process(delta):
	translate(Vector2(speed*direcao*delta, 0))


func _on_TimerPatrulha_timeout():
	direcao *= -1


func _on_AreaImpacto_body_entered(body):
	$Animacao.play("amassado")
	queue_free()

