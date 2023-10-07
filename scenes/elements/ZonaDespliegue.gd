extends Node2D

@onready var zona_depliegue = $"."
var carta_separacion = 25  # La distancia entre las cartas en el eje X
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_lista_cartas_desplegar(cartas_desplegar):
	for i in range(cartas_desplegar.size()):
		add_child(cartas_desplegar[i])
	arrange_cards()
	
	
# Función para distribuir las cartas a lo largo del eje X
func arrange_cards() -> void:
	var num_cartas = zona_depliegue.get_child_count()
	var separacion_total = num_cartas * carta_separacion
	var posicion_inicial = -separacion_total / 2  # Centro las cartas

	for i in range(num_cartas):
		var card = zona_depliegue.get_child(i)
		
		card.position.x = posicion_inicial + i * carta_separacion

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
