extends Node2D


func _ready():
	if Info.player_name != "":
		$Options/Name.text = Info.player_name


func _on_name_text_changed(new_text):
	Info.player_name = new_text
	

func _on_join_pressed():
	MPC.join_player()
	get_node("/root/Main").change_scene("res://scenes/screens/Join.tscn")

func _on_new_pressed():
	MPC.host_player()
	get_node("/root/Main").change_scene("res://scenes/screens/Table.tscn")

func _on_quit_pressed():
	get_tree().quit()
