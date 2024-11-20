extends Node2D


func _on_button_pressed():
	
	get_tree().change_scene_to_file("res://Scenes/footsaur.tscn")
	Global.Player1Score = 0
	Global.Player2Score = 0
	
	pass 
