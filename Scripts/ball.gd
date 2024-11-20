extends RigidBody2D


var impulse = Vector2(0, -1)


func _ready():
	pass

func _on_area_2d_body_entered(body):
	if body.is_in_group("Floor"):
		apply_central_impulse(impulse)

func _on_area_2d_area_entered(area):
	if area.is_in_group("Left"):
		Global.Player2Score += 1
		if Global.Player2Score <= 2:
			get_tree().reload_current_scene()
		
		
	elif area.is_in_group("Right"):
		Global.Player1Score += 1
		if Global.Player1Score <= 2:
			get_tree().reload_current_scene()
	
	if Global.Player1Score >= 3:
		get_tree().change_scene_to_file("res://Scenes/alekwin.tscn")
	
	if Global.Player2Score >= 3:
		get_tree().change_scene_to_file("res://Scenes/dougwin.tscn")
			
	pass
