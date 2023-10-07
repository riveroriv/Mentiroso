extends Node

signal lista_cartas_desplegar
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func mandar_cartas_zona_despliegue(cartas_desplegar):
	emit_signal("lista_cartas_desplegar", cartas_desplegar)
