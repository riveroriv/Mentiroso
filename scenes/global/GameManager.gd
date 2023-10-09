extends Node

var Players = {}
#Esto se usa para poder probar el lobby ranking y sala de espera
#var Players = ["Willan","Arianne"]

func order_by_order():
	var ids = [0,0,0,0]
	for i in Players:
		ids[Players[i].order] = i
	return ids
	
func order_by_relative(id):
	var ids = order_by_order()
	var idsr = []
	ids.append_array(ids)
	var aparecio = false
	
	for i in ids:
		if i == id and not aparecio:
			idsr.append(i)
			aparecio = true
		elif i == id and aparecio:
			break;
		elif aparecio:
			idsr.append(i)
	return idsr


