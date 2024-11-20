extends Node2D

func ready():
	pass

func _process(delta):
	$Score1.text = str (Global.Player1Score)
	$Score2.text = str (Global.Player2Score)
pass
