extends Node2D

var room_code = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_code_text_changed(new_text):
	room_code = new_text

#verifica que exista y conecta, sino error
