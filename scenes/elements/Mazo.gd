extends Node2D

const escena_carta = preload("res://scenes/elements/Card.tscn")
@onready var mazo = $"."
#var spread_curve: Curve2D
var carta_separacion = 25  # La distancia entre las cartas en el eje X

# Called when the node enters the scene tree for the first time.
func _ready():
	add_5_cards()
	
	
func add_5_cards()->void:
	for _x in 10:
		var card = escena_carta.instantiate()
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
		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
