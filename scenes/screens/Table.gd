extends Node2D

@onready var hand = $Hands/Hand
@onready var hand_l = $Hands/Left
@onready var hand_t = $Hands/Top
@onready var hand_r = $Hands/Right


const VALUES = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
const SUITS = ["espada", "trebol", "corazon", "diamante"]


var skin = "normal"

func barajado(value_subset, players = 4):
	var baraja = []
	var hands = []
	
	for i in range(value_subset):
		for suit in SUITS:
			baraja.append([VALUES[i], suit])
	baraja.shuffle()
	
	for p in range(players):
		var player_cards = []
		for c in range(value_subset):
			player_cards.append(baraja.pop_front())
		hands.append(player_cards)
	return hands


func _ready():
	var name = get_node("/root/Main").player_name
	if name != null:
		print(name)
		$Players/Bottom/Label.text = name
	
	hand.ownership = true
	hand_l.vertical = true
	hand_l.arrange_cards()
	hand_r.vertical = true
	hand_r.arrange_cards()
	
	var hands = barajado(12)
	hand.add_cards(hands[0])
	hand_l.add_cards(hands[1])
	hand_t.add_cards(hands[2])
	hand_r.add_cards(hands[3])
	
	


# esta función es para acusar - se acciona al hacer click en el boton mentiroso o presionar M
func mentiroso():
	pass
	
# aquí se envía una señal con las cartas que se escogió para botarlas
func descartar_cartas():
	pass
	
# seleccionar carta para descartar, accionada con click o espacio
func select_card():
	pass

func unselect_card():
	pass

# las cartas del montón pasan a la mano de un jugador
func penalizar():
	pass
	
	
