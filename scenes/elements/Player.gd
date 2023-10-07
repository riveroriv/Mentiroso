extends Node2D
signal lista_cartas_desplegar(cartas_desplegar)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_desplegar_pressed():
	var cartas_desplegar = $Mazo.desplegar_cartas()
	for carta in cartas_desplegar:
		print(carta)
	emit_signal("lista_cartas_desplegar", cartas_desplegar)
