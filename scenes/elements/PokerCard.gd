extends Node2D

# Preload the Card scene.
#const Card = preload("res://scenes/screens/Card.tscn")
@onready var card = $Card
var posicion_inicial_y=self.position.y
var scale_inicial= self.scale
var card_select=false
const MOVER_CARTA=60

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
	# Generate the chosen card.
	#var card = Card.instantiate()
	#add_child(card)
	
	# Set the card icon and base textures.
	card.get_node("CardIcon").texture = load("res://resources/img/" + chosen_suit + ".png")
	card.get_node("CardBase").texture = load("res://resources/img/baseCarta.png")
	
	# Set the card value.
	card.get_node("CardValue").text = chosen_value
	
	# Position the card on the screen (you can adjust this to suit your needs).
	# card.position = Vector2(randf_range(0, get_viewport().size.x), randf_range(0, get_viewport().size.y))
	# card.position = get_viewport().size / 2
	

func _on_carta_mouse_entered():
	self.scale+=Vector2(0.1,0.1)
	if !card_select:
		self.position.y -= MOVER_CARTA


func _on_carta_mouse_exited():
	self.scale-=Vector2(0.1,0.1)
	if !card_select:
		self.position.y += MOVER_CARTA


func _on_carta_pressed():
	if !card_select:
		#self.position.y = posicion_inicial_y-MOVER_CARTA
		self.position.y = posicion_inicial_y-MOVER_CARTA
		card_select=true
	else:
		card_select=false

