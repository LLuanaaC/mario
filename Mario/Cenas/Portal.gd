extends Node2D


func reinicia_posicao():
	$Player.position = Vector2(0, 0)
	
	
func _on_Player_morreu():
	reinicia_posicao()
	
	
func _on_Portal_body_entered(body):
	get_tree().change_scene("res://cenas/Level2.tscn")


func _on_Moeda_pegou_moeda():
	$Player.coins += 1
