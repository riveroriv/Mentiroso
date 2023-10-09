extends Node2D
@onready var control_ranking = $ControlRanking



func actualizar_ranking():
	control_ranking.get_node("Ranking/Rank1/Icono").texture = load("res://resources/logo/corona.png")
	for i in GameManager.Players.size():
		control_ranking.get_node("Ranking/Rank"+str(i+1)).visible = true
		control_ranking.get_node("Ranking/Rank"+str(i+1)+"/Puntuacion").visible = true
		control_ranking.get_node("Ranking/Rank"+str(i+1)+"/Nombre").text=GameManager.Players[i]
		control_ranking.get_node("Ranking/Rank"+str(i+1)+"/Puntuacion").text="10"
		
func actualizar_sala_espera():
	control_ranking.get_node("Ranking/Rank1/Icono").texture = load("res://resources/logo/home.png")
	for i in GameManager.Players.size():
		control_ranking.get_node("Ranking/Rank"+str(i+1)).visible = true
		control_ranking.get_node("Ranking/Rank"+str(i+1)+"/Puntuacion").visible = true
		control_ranking.get_node("Ranking/Rank"+str(i+1)+"/Puntuacion").text=""
		control_ranking.get_node("Ranking/Rank"+str(i+1)+"/Nombre").text=GameManager.Players[i]


# Called when the node enters the scene tree for the first time.
func _ready():
	control_ranking.get_node("Ranking/Rank1").visible = false
	control_ranking.get_node("Ranking/Rank2").visible = false
	control_ranking.get_node("Ranking/Rank3").visible = false
	control_ranking.get_node("Ranking/Rank4").visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#actualizar_ranking()
	actualizar_sala_espera()
	pass
