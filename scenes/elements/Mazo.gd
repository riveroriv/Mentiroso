extends Node2D

const poker_card = preload("res://scenes/elements/PokerCard.tscn")
@onready var mazo = $"."
var carta_separacion = 25  # La distancia entre las cartas en el eje X


# Called when the node enters the scene tree for the first time.
func _ready():
	add_n_cards()
	
	
func add_n_cards()->void:
	for _x in 10:
		var card = poker_card.instantiate()
		add_child(card)
	arrange_cards()
		
# Función para distribuir las cartas a lo largo del eje X
func arrange_cards() -> void:
	var num_cartas = mazo.get_child_count()
	determinar_separacion_cartas(num_cartas)
	var separacion_total = num_cartas * carta_separacion
	var posicion_inicial = -separacion_total / 2  # Centro las cartas

	for i in range(num_cartas):
		var card = mazo.get_child(i)
		card.position.x = posicion_inicial + i * carta_separacion
		
func desplegar_cartas():
	var num_cartas = mazo.get_child_count()
	var cartas_eliminar=[]
	var lista_cartas_desplegar=[]
	for i in range(num_cartas):
		var card = mazo.get_child(i)
		#print(card.card_select)
		if card.card_select==true:
			#card.global_position = Vector2(650, 350)
			cartas_eliminar.append(card)
			lista_cartas_desplegar.append(card.chosen_suit)
			lista_cartas_desplegar.append(card.chosen_value)
			
	for i in range(cartas_eliminar.size()):
		var card = cartas_eliminar[i]
		remove_child(card)
		arrange_cards()
	return lista_cartas_desplegar
func determinar_separacion_cartas(num_cartas):
	if num_cartas>30:
		carta_separacion=10
	elif  num_cartas>20:
		carta_separacion=15
	elif  num_cartas>10:
		carta_separacion=20
	else:
		carta_separacion=25
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

