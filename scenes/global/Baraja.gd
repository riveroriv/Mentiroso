extends Node


const VALUES = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
const SUITS = ["espada", "trebol", "corazon", "diamante"]
var skin = "normal"
var hands = []

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

func is_value(cartas, value):
	for carta in cartas:
		if carta[0] != value:
			return false
	return true
