extends Node2D

var card_block : Control
const card_scene = preload("res://scenes/elements/PokerCard.tscn")

func _ready():
	print(get_viewport().size)
	card_block = $Hand
	for i in range(5):
		var card_instance = card_scene.instantiate()
		card_block.add_child(card_instance)

func _process(_delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction > 0:
		var card = card_scene.instantiate()
		card.position = get_local_mouse_position()
		card_block.add_child(card)
