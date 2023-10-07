extends Node2D

# Preload the Card scene.
#const Card = preload("res://scenes/screens/Card.tscn")
@onready var burbuja = $Burbuja


# Define the card values and suits.
var values = ["Mentiroso", "Verdad", "Paso"]

# Define the chosen suit and value.
var chosen_value = values[random_arreglo(values)]

func random_arreglo(arreglo):
	# Obtener la longitud del arreglo
	var longitud = arreglo.size()
	# Generar un índice aleatorio entre 0 y la longitud del arreglo - 1
	var indice_aleatorio = randi() % longitud
	return indice_aleatorio
	
func _ready():
	# Generate the chosen card.
	#var card = Card.instantiate()
	#add_child(card)
	
	# Set the card value.
	burbuja.get_node("Texto").text = chosen_value
	
	# Position the card on the screen (you can adjust this to suit your needs).
	# card.position = Vector2(randf_range(0, get_viewport().size.x), randf_range(0, get_viewport().size.y))
	# card.position = get_viewport().size / 2
