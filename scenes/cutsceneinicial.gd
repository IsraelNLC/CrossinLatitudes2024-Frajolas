extends Node2D

var colorrect: ColorRect
# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_example_dialogue_balloon(load("res://introcutscene.dialogue"), "cutscenestart")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
