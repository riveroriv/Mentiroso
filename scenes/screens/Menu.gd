extends Node2D

	
	
'''
@export var Address = "192.168.127.133"
@export var port = 8910
var peer

func _ready():
	multiplayer.peer_connected.connect(peer_connected)
	multiplayer.peer_disconnected.connect(peer_disconnected)
	multiplayer.connected_to_server.connect(connected_to_server)
	multiplayer.connection_failed.connect(connection_failed)
	#if "--server" in OS.get_cmdline_args():
	#	hostGame()
	pass


func _on_salir_pressed():
	get_tree().quit()

func peer_connected(id):
	print("Player Connected " + str(id))
	
	
func peer_disconnected(id):
	print("Player Disconnected " + str(id))
	GameManager.Players.erase(id)
	var players = get_tree().get_nodes_in_group("Player")
	for i in players:
		if i.name == str(id):
			i.queue_free()
# called only from clients
func connected_to_server():
	print("connected To Sever!")
	SendPlayerInformation.rpc_id(1, $LineEdit.text, multiplayer.get_unique_id())

# called only from clients
func connection_failed():
	print("Couldnt Connect")
'''
