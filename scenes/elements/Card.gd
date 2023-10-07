extends Node2D

@onready var front = $Faces/Front
@onready var faces = $Faces

@onready var posicion_inicial_y = faces.position.y
@onready var scale_inicial = faces.scale

var card_select = false
const MOVER_CARTA = 130

# Define the card values and suits.
var values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "=", "J", "Q", "K"]
var suits = ["espada", "trebol", "corazon", "diamante"]

# Define the chosen suit and value.
var chosen_suit = suits[random_arreglo(suits)]
var chosen_value = values[random_arreglo(values)]

func random_arreglo(arreglo):
	# Obtener la longitud del arreglo
	var longitud = arreglo.size()
	# Generar un índice aleatorio entre 0 y la longitud del arreglo - 1
	var indice_aleatorio = randi() % longitud
	return indice_aleatorio
	
func _ready():
	# Set the card icon and base textures.
	front.get_node("CardIcon").texture = load("res://resources/img/" + chosen_suit + ".png")
	front.get_node("CardBase").texture = load("res://resources/img/baseCarta.png")
	# Set the card value.
	front.get_node("CardValue").text = chosen_value
	
func hover():
	faces.scale+=Vector2(0.1,0.1)
	if !card_select:
		faces.position.y -= MOVER_CARTA


func leave():
	faces.scale-=Vector2(0.1,0.1)
	if !card_select:
		faces.position.y += MOVER_CARTA


func click():
	if !card_select:
		#self.position.y = posicion_inicial_y-MOVER_CARTA
		faces.position.y = posicion_inicial_y-MOVER_CARTA
		card_select=true
	else:
		card_select=false



func _on_click_area_pressed():
	print("click")
	click()


func _on_click_area_mouse_entered():
	print("enter")
	hover()


func _on_click_area_mouse_exited():
	print("exit")
	leave()
