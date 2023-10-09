extends Node2D

@onready var hand = $Hands/Hand
@onready var hand_l = $Hands/Left
@onready var hand_t = $Hands/Top
@onready var hand_r = $Hands/Right
@onready var burbujas_chat ={
	"hand": $Hands/Hand/BurbujaChat,
	"left": $Hands/Left/BurbujaChat,
	"top": $Hands/Top/BurbujaChat,
	"right": $Hands/Right/BurbujaChat
}




func barajado(value_subset, players = 4):
	var baraja = []
	var hands = []
	
	for i in range(value_subset):
		for suit in Baraja.SUITS:
			baraja.append([Baraja.VALUES[i], suit])
	baraja.shuffle()
	
	for p in range(players):
		var player_cards = []
		for c in range(value_subset):
			player_cards.append(baraja.pop_front())
		hands.append(player_cards)
	return hands


func _ready():
	Info.player_name
	if Info.player_name != "":
		$Players/Bottom/Label.text = Info.player_name
	
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
	mentiroso()
	


# esta función es para acusar - se acciona al hacer click en el boton mentiroso o presionar M
func mentiroso(hand="hand"):
	burbujas_chat[hand].visible = true
	burbujas_chat[hand].elegir_palabra(0)
	
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
	
	
