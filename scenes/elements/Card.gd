extends Node2D

var animation_player : AnimationPlayer
var posicion_inicial_y=self.position.y
var scale_inicial= self.scale
var card_select=false
var nombre=""
const MOVER_CARTA=40

func _ready():
	animation_player = $AnimationPlayer

func _on_card_clicked():
	animation_player.play("flip") 


func _on_texture_button_mouse_entered():
	self.scale+=Vector2(0.2,0.2)
	if !card_select:
		#self.position.y -= MOVER_CARTA
		$Face.position.y -= MOVER_CARTA
		$Back.position.y -= MOVER_CARTA
		
		

func _on_texture_button_mouse_exited():
	self.scale-=Vector2(0.2,0.2)
	if !card_select:
		#self.position.y += MOVER_CARTA
		$Face.position.y += MOVER_CARTA
		$Back.position.y += MOVER_CARTA
		


func _on_texture_button_pressed():
	if !card_select:
		#self.position.y = posicion_inicial_y-MOVER_CARTA
		$Face.position.y = posicion_inicial_y-MOVER_CARTA
		$Back.position.y = posicion_inicial_y-MOVER_CARTA
		card_select=true
	else:
		card_select=false

