extends Node2D

@onready var cards = $Cards

const poker_card = preload("res://scenes/elements/Card.tscn")

var carta_separacion = 40  # La distancia entre las cartas en el eje X
var factor_separador_vertical = 0.6 # porcentaje de separación
var arrage_time = 1.0
var elapsed_time = 0.0
var ownership = false
var vertical = false


func add_cards(cards)->void:
	for card in cards:
		add_card(card[0], card[1])
	arrange_cards()

func add_card(value="A", suit="espada"):
	var card = poker_card.instantiate()
	card.value = value;
	card.suit = suit;
	card.ownership = ownership
	cards.add_child(card)
	arrange_cards()


# Función para distribuir las cartas a lo largo del eje X
func arrange_cards() -> void:
	var num_cartas = cards.get_child_count()
	determinar_separacion_cartas(num_cartas)
	var separacion_total = num_cartas * carta_separacion
	var posicion_inicial = -separacion_total / 2  # Centro las cartas

	for i in range(num_cartas):
		var card = cards.get_child(i)
		var posicion_final = Vector2(
			posicion_inicial + i * carta_separacion,
			card.position.y
			)
		card.position = posicion_final
		
func desplegar_cartas():
	var num_cartas = cards.get_child_count()
	var cartas_eliminar=[]
	var lista_cartas_desplegar=[]
	for i in range(num_cartas):
		var card = cards.get_child(i)
		#print(card.card_select)
		if card.card_select==true:
			#card.global_position = Vector2(650, 350)
			cartas_eliminar.append(card)
			lista_cartas_desplegar.append([card.value, card.suit])
	
	for i in range(cartas_eliminar.size()):
		
		var card = cartas_eliminar[i]
		#card.ownership=ownership
		print(card.value)
		card.queue_free()
	arrange_cards()
	return lista_cartas_desplegar
	
func determinar_separacion_cartas(num_cartas):
	if num_cartas>30:
		carta_separacion=20
	elif  num_cartas>20:
		carta_separacion=25
	elif  num_cartas>10:
		carta_separacion=30
	else:
		carta_separacion=40
	
	if vertical:
		carta_separacion*=factor_separador_vertical
		
	
