extends Node2D

var player_name = null;

func _ready():
	if get_node("/root/Main").player_name != null:
		$Control/Name.text = get_node("/root/Main").player_name


func _on_name_text_changed(new_text):
	player_name = new_text
	

func _on_unirse_pressed():
	get_node("/root/Main").change_scene("res://scenes/screens/Join.tscn", player_name)

func _on_nueva_pressed():
	get_node("/root/Main").change_scene("res://scenes/screens/Table.tscn", player_name)

func _on_salir_pressed():
	get_tree().quit()
