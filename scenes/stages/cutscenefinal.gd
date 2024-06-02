extends Node2D

@onready var globalvars = $"/root/Globalvars"
# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_example_dialogue_balloon(load("res://conversations.dialogue"), "dialogo_conclusao")
	return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(globalvars.conclusiondialogueover == true):
		globalvars.conclusiondialogueover = false
		globalvars.lastdialogueover = false
		globalvars.isdialogueover = false
		get_tree().change_scene_to_file("res://scenes/menu/main_menu/main_menu.tscn")
