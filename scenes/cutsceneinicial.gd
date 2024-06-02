extends Node2D

var colorrect: ColorRect
@onready var globalvars = $"/root/Globalvars"
# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_example_dialogue_balloon(load("res://introcutscene.dialogue"), "cutscenestart")
	return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (globalvars.isdialogueover == true):
		get_tree().change_scene_to_file("res://scenes/stages/home.tscn")
	
