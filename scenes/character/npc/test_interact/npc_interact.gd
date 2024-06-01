extends Node2D

# adicionando o dialogo

@export var selectedindex = 0

@export var lines: Array[String] = [
	"this_is_a_node_title",
	"this_is_another_title",
]

@onready var interaction_area = $InteractionArea
@onready var sprite = $Sprite2D

func _ready():
	interaction_area.interact = Callable(self, '_interact')

func _interact():
	print('interact successful')
	DialogueManager.show_example_dialogue_balloon(load("res://example.dialogue"), lines[selectedindex])
