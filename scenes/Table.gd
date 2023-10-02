extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(5):
		var card = preload("res://elements/Card.tscn")
		$Cards.add_child(card


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
