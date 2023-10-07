extends Node2D

var card_block : Control
<<<<<<< HEAD
const card_scene = preload("res://scenes/elements/PokerCard.tscn")
=======
const card_scene = preload("res://scenes/elements/Card.tscn")
var arg = null
>>>>>>> 3481d6ac069e715be5b1c54c74db0ac47f027597

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

# esta función es para acusar - se acciona al hacer click en el boton mentiroso o presionar M
func mentiroso():
	pass
	
# aquí se envía una señal con las cartas que se escogió para botarlas
func descartar_cartas():
	pass
	
# seleccionar carta para descartar, accionada con click o espacio
func select_card():
	pass

func unselect_card():
	pass

# las cartas del montón pasan a la mano de un jugador
func penalizar():
	pass
