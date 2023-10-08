extends Node2D

var item_list
var line_edit

func _ready():
	item_list = $ItemList
	line_edit = $LineEdit


func _on_add_button_pressed():
	var item_name = line_edit.text.strip_edges() 
	if item_name != "":
		item_list.add_item(item_name)
		line_edit.text = ""



