extends Node

var peer

# Called when the node enters the scene tree for the first time.
func _ready():
	multiplayer.peer_connected.connect(peer_connected)
	multiplayer.peer_disconnected.connect(peer_disconnected)
	multiplayer.connected_to_server.connect(connected_to_server)
	multiplayer.connection_failed.connect(connection_failed)
	if "--server" in OS.get_cmdline_args():
		host_game()
	pass # Replace with function body.


# this get called on the server and clients
func peer_connected(id):
	pass


# this get called on the server and clients
func peer_disconnected(id):
	GameManager.Players.erase(id)


# called only from clients
func connected_to_server():
	send_player_info.rpc_id(1, Info.player_name, multiplayer.get_unique_id())


# called only from clients
func connection_failed():
	print("Couldnt Connect")
	




@rpc("any_peer")
func send_player_info(player_name, id, order=0, ownership=false):
	if !GameManager.Players.has(id):
		GameManager.Players[id] ={
			"name" : player_name,
			"id" : id,
			"score": 0,
			"owner": ownership,
			"order": len(GameManager.Players)
		}
	
	if multiplayer.is_server():
		print(player_name, "  ->  ", GameManager.Players)
		for i in GameManager.Players:
			send_player_info.rpc(
				GameManager.Players[i].name,
				i,
				GameManager.Players[i].order,
				GameManager.Players[i].owner)

func host_game():
	peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(Info.port, 10)
	if error != OK:
		print("cannot host: " + error)
		return
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	
	multiplayer.set_multiplayer_peer(peer)
	print("Waiting For Players!")
	
	
func host_player():
	host_game()
	send_player_info(Info.player_name, multiplayer.get_unique_id(), true)
	pass


func join_player():
	peer = ENetMultiplayerPeer.new()
	peer.create_client(Info.address, Info.port)
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	multiplayer.set_multiplayer_peer(peer)	
	pass


func leave_player():
	#multiplayer.network_peer.close_connection(multiplayer.get_unique_id())
	get_node("/root/Main").change_scene("res://scenes/screens/Menu.tscn")
	

func get_my_id():
	return multiplayer.get_unique_id()
	
	
@rpc("any_peer")
func send_hands(hands):
	Baraja.hands = hands
	if multiplayer.is_server():
		var hands_barajada = Baraja.barajado(12)
		send_hands.rpc(hands_barajada)
	
@rpc("any_peer", "call_local")
func start_game():
	get_node("/root/Main").change_scene("res://scenes/screens/Table.tscn")
	
@rpc("any_peer","call_local")
func end_game():
	get_node("/root/Main").change_scene("res://scenes/screens/Lobby.tscn", true)


