extends Node2D

@onready var hand = $Hands/Hand
@onready var hand_l = $Hands/Left
@onready var hand_t = $Hands/Top
@onready var hand_r = $Hands/Right

@onready var last = $Pila/Last

@onready var hands ={
	"hand": $Hands/Hand,
	"left": $Hands/Left,
	"top": $Hands/Top,
	"right": $Hands/Right
}

@onready var burbujas_chat ={
	"hand": $Hands/Hand/BurbujaChat,
	"left": $Hands/Left/BurbujaChat,
	"top": $Hands/Top/BurbujaChat,
	"right": $Hands/Right/BurbujaChat
}

@onready var names ={
	"hand": $Players/Bottom/Label,
	"left": $Players/Left/Label,
	"top": $Players/Top/Label,
	"right": $Players/Right/Label
}
var player_order = {
	"hand" = 0,
	"left" = 1,
	"top" = 2,
	"right" = 3
	}

var turn_mine = false
var turn_next = false
var turn = 0
var positions = ["hand", "left", "top", "right"]



func _ready():
	Info.player_name
	if Info.player_name != "":
		$Players/Bottom/Label.text = Info.player_name
	var relative_order = GameManager.order_by_relative(MPC.get_my_id())
	var index = 0
	
	for p in positions:
		player_order[p]=relative_order[index]
		names[p].text = GameManager.Players[relative_order[index]].name
		index+=1	
	
	
	hand.ownership = true
	hand_l.vertical = true
	hand_l.arrange_cards()
	hand_r.vertical = true
	hand_r.arrange_cards()
	
	#var hands =	Baraja.hands
	var hands =	Baraja.barajado(12)
	
	hand.add_cards(hands[0])
	hand_l.add_cards(hands[1])
	hand_t.add_cards(hands[2])
	hand_r.add_cards(hands[3])
	


# esta función es para acusar - se acciona al hacer click en el boton mentiroso o presionar M
func mentiroso(hand="hand"):
	burbujas_chat[hand].visible = true
	burbujas_chat[hand].elegir_palabra(0)
	
# aquí se envía una señal con las cartas que se escogió para botarlas
func descartar_cartas(hand="hand"):
	last.add_cards(hands[hand].desplegar_cartas())
	
# seleccionar carta para descartar, accionada con click o espacio
func select_card():
	pass

func unselect_card():
	pass

# las cartas del montón pasan a la mano de un jugador
func penalizar():
	pass
	
func _process(delta):
	if Input.is_action_pressed("mentiroso"):
		mentiroso()
	else:
		burbujas_chat["hand"].visible = false
	
	if Input.is_action_pressed("descartar"):
		descartar_cartas()
	
	
