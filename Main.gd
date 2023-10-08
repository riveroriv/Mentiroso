extends Node2D


@onready var current_scene = null
var next_scene = null
var full_screen = false


func _ready():
	change_scene("res://scenes/screens/Menu.tscn")

func change_scene(scene_path, arg = null):
	next_scene = load(scene_path).instantiate()
	if next_scene.has_node("arg"):
		next_scene.arg = arg
	if current_scene:
		current_scene.queue_free()
	add_child(next_scene)
	current_scene = next_scene

func _input(event):
	if event.is_action_pressed("full_screen"):
		if full_screen:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			full_screen = false
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			full_screen = true
			
	if event.is_action_pressed("exit_full_screen") and full_screen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		full_screen = false
			
