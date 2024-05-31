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


#Para funcionar o dialogo, precisa colocar essa parada ->
#func _unhandled_input(event):
	#if event.is_action_pressed("interact"):
		#if interaction_area.get_overlapping_bodies().size() > 0:
			#DialogueManager.start_dialog(global_position,lines)
