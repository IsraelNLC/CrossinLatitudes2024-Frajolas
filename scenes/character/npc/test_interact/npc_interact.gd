extends Node2D

# adicionando o dialogo

@export var selectedindex = 0

@export var lines: Array[String] = [
	"lucas_reception",
	"dialogo_antes_do_nivel_1",
	"dialogo_depois_do_nivel_1",
	"dialogo_antes_do_nivel_2",
	"dialogo_depois_do_nivel_2",
	"dialogo_conclusao"
]

@onready var interaction_area = $InteractionArea
@onready var sprite = $Sprite2D

func _ready():
	interaction_area.interact = Callable(self, '_interact')

func _interact():
	print('interact successful')
	DialogueManager.show_example_dialogue_balloon(load("res://conversations.dialogue"), lines[selectedindex])
