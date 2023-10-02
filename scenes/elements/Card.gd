extends Node2D

var animation_player : AnimationPlayer

func _ready():
	animation_player = $AnimationPlayer

func _on_card_clicked():
	animation_player.play("flip") 
