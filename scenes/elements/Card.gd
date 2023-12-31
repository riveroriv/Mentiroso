extends Node2D

@onready var front = $Faces/Front
@onready var faces = $Faces
@onready var back = $Faces/Back

@onready var posicion_inicial_y = faces.position.y
@onready var scale_inicial = faces.scale

var card_select = false
var ownership = false
const MOVER_CARTA = 130

# Define the chosen suit and value.
var suit = Baraja.SUITS[random_arreglo(Baraja.SUITS)]
var value = Baraja.VALUES[random_arreglo(Baraja.VALUES)]

func random_arreglo(arreglo):
	# Obtener la longitud del arreglo
	var longitud = arreglo.size()
	# Generar un índice aleatorio entre 0 y la longitud del arreglo - 1
	var indice_aleatorio = randi() % longitud
	return indice_aleatorio
	
func _ready():
	# Set the card icon and base textures.
	front.get_node("CardIcon").texture = load("res://resources/img/" + suit + ".png")
	#front.get_node("CardBase").texture = load("res://resources/img/baseCarta.png")
	# Set the card value.
	front.get_node("CardValue").text = value
	if !ownership:
		back.z_index = 1
	else:
		back.z_index = 0
	
func hover():
	if (ownership):
		faces.scale+=Vector2(0.1,0.1)
		if !card_select:
			faces.position.y -= MOVER_CARTA


func leave():
	if (ownership):
		faces.scale-=Vector2(0.1,0.1)
		if !card_select:
			faces.position.y += MOVER_CARTA


func click():
	if (ownership):
		if !card_select:
			#self.position.y = posicion_inicial_y-MOVER_CARTA
			faces.position.y = posicion_inicial_y-MOVER_CARTA
			card_select=true
		else:
			card_select=false


func _on_click_area_pressed():
	click()

func _on_click_area_mouse_entered():
	hover()

func _on_click_area_mouse_exited():
	leave()

func reveal():
	$AnimationPlayer.play("flip")
