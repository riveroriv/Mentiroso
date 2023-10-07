extends Node2D

# Preload the Card scene.
const Card = preload("res://Scenes/Card.tscn")

# Define the card values and suits.
var values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "=", "J", "Q", "K"]
var suits = ["espada", "trebol", "corazon", "diamante"]

# Define the chosen suit and value.
var chosen_suit = "corazon"
var chosen_value = "="

func _ready():
	# Generate the chosen card.
	var card = Card.instantiate()
	add_child(card)
	
	# Set the card icon and base textures.
	card.get_node("CardIcon").texture = load("res://Art/" + chosen_suit + ".png")
	card.get_node("CardBase").texture = load("res://Art/baseCarta.png")
	
	# Set the card value.
	card.get_node("CardValue").text = chosen_value
	
	# Position the card on the screen (you can adjust this to suit your needs).
	# card.position = Vector2(randf_range(0, get_viewport().size.x), randf_range(0, get_viewport().size.y))
	card.position = get_viewport().size / 2
	
