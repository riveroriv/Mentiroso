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
	print("Player Connected " + str(id))


# this get called on the server and clients
func peer_disconnected(id):
	print("Player Disconnected " + str(id))
	GameManager.Players.erase(id)


# called only from clients
func connected_to_server():
	print("connected To Sever!")
	send_player_info.rpc_id(1, Info.name, multiplayer.get_unique_id())


# called only from clients
func connection_failed():
	print("Couldnt Connect")
	




@rpc("any_peer")
func send_player_info(name, id):
	if !GameManager.Players.has(id):
		GameManager.Players[id] ={
			"name" : name,
			"id" : id,
			"score": 0
		}
	
	if multiplayer.is_server():
		for i in GameManager.Players:
			send_player_info.rpc(GameManager.Players[i].name, i)

@rpc("any_peer","call_local")
func start_game():
	var scene = load("res://testScene.tscn").instantiate()
	get_tree().root.add_child(scene)
	
	
func host_game():
	peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(Info.port, 2)
	if error != OK:
		print("cannot host: " + error)
		return
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	
	multiplayer.set_multiplayer_peer(peer)
	print("Waiting For Players!")
	
	
func host_player():
	host_game()
	send_player_info(Info.player_name, multiplayer.get_unique_id())
	pass


func join_player():
	peer = ENetMultiplayerPeer.new()
	peer.create_client(Info.address, Info.port)
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	multiplayer.set_multiplayer_peer(peer)	
	pass 
