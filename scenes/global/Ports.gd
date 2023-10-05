extends Node
# haz una clase room con características: port, players, status, 


var first_room = 8910 + 1
var rooms = 5

func _ready():
	for i in range(rooms):
		ports[first_room+i] = false
		codes[first_room+i] = ""
		size[first_room+i] = 0
		

func is_any_available():
	if false in ports:
		return true
	return false

func get_available():
	for port in ports:
			

func reserve():
	if is_any_available():
		ports[port] = true
	return port

func free(port):
	ports[port] = false
