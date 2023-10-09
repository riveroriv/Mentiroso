extends Node2D
@onready var control_ranking = $ControlRanking

var icon = {
	"rank": "res://resources/logo/corona.png",
	"lobby": "res://resources/logo/home.png"
}
var type = "lobby"
@onready var ranking = {
	0: control_ranking.get_node("Ranking/Rank1"),
	1: control_ranking.get_node("Ranking/Rank2"),
	2: control_ranking.get_node("Ranking/Rank3"),
	3: control_ranking.get_node("Ranking/Rank4")
}


func actualizar():
	for rank in ranking:
		ranking[rank].visible = false
	var index = 1
	for player in GameManager.Players:
		index+=1	
		if index > 4:
			break
		ranking[index-1].visible = true
		control_ranking.get_node("Ranking/Rank"+str(index)+"/Puntuacion").visible = true
		control_ranking.get_node("Ranking/Rank"+str(index)+"/Puntuacion").text=(str(GameManager.Players[player].score) if type == "rank" else "")
		control_ranking.get_node("Ranking/Rank"+str(index)+"/Nombre").text = GameManager.Players[player].name



# Called when the node enters the scene tree for the first time.
func _ready():
	#if type == "rank":
		#for player in GameManager.Players.sort():
			#control_ranking.get_node("Ranking/Rank1/Icono").texture = load(icon[type])
	for rank in ranking:
		ranking[rank].visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#actualizar_ranking()
	actualizar()


func _on_back_pressed():
	MPC.leave_player()


func _on_play_pressed():
	MPC.start_game.rpc()
