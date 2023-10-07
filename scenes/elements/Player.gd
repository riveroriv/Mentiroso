extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_desplegar_pressed():
	var cartas_desplegar = $Mazo.desplegar_cartas()
	#for carta_info in cartas_desplegar:
	#print(carta_info)
	Global.mandar_cartas_zona_despliegue(cartas_desplegar)
	
