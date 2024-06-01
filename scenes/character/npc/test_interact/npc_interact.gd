extends Node2D

# adicionando o dialogo
const lines: Array[String] = [
	"Hello world!",
	"Isso é um testa",
	"Eita como testa",
	"Rapadura é doce, mas não é mole não!"
]


@onready var interaction_area = $InteractionArea
@onready var sprite = $Sprite2D

func _ready():
	interaction_area.interact = Callable(self, '_interact')

func _interact():
	print('interact successful')
	DialogueManager.show_example_dialogue_balloon(load("res://example.dialogue"), "this_is_a_node_title")
