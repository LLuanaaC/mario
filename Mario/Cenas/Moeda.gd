extends Area2D

signal pegou


func _on_Moeda_body_entered(body):
	if body is Player:
		Global.score += 1
		get_node("/root/Level/CanvasLayer").update_score()
		queue_free()
	
