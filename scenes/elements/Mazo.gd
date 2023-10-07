extends Node2D

const escena_carta = preload("res://scenes/elements/Card.tscn")
@onready var mazo = $"."
var carta_separacion = 25  # La distancia entre las cartas en el eje X


# Called when the node enters the scene tree for the first time.
func _ready():
	add_5_cards()
	
	
func add_5_cards()->void:
	for _x in 10:
		var card = escena_carta.instantiate()
		card.nombre=_x
		add_child(card)
	arrange_cards()
		
# Función para distribuir las cartas a lo largo del eje X
func arrange_cards() -> void:
	var num_cartas = mazo.get_child_count()
	var separacion_total = num_cartas * carta_separacion
	var posicion_inicial = -separacion_total / 2  # Centro las cartas

	for i in range(num_cartas):
		var card = mazo.get_child(i)
		
		card.position.x = posicion_inicial + i * carta_separacion
		
func desplegar_cartas():
	var num_cartas = mazo.get_child_count()
	var cartas_eliminar=[]
	for i in range(num_cartas):
		var card = mazo.get_child(i)
		#print(card.nombre)
		#print(card.card_select)
		if card.card_select==true:
			card.global_position = Vector2(650, 350)
			cartas_eliminar.append(card)
			
	for i in range(cartas_eliminar.size()):
		var card = cartas_eliminar[i]
		remove_child(card)
		arrange_cards()
	return cartas_eliminar

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

