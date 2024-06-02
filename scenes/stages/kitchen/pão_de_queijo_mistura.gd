extends Node2D

@onready var tigela1 = $hand_npc
@onready var tigela2 = $hand_player

@onready var main = $"../"

func start_animation():
	main.enrolar.visible = false
	main.ralador.visible = false
	main.misturar.visible = true

func mix_1():
	if tigela1.position.x == 291:
		if tigela1.position.y == 521:
			tigela1.position.x = 354
			return
		else:
			tigela1.position.y = 521
			return
	elif tigela1.position.x ==354 && tigela1.position.y == 521:
		tigela1.position.y = 547
		return
	else:
			tigela1.position.y = 521
			return
			
func mix_2():
	if tigela2.position.x == 931:
		if tigela2.position.y == 521:
			tigela2.position.x = 994
			return
		else:
			tigela2.position.y = 931
			return
	elif tigela2.position.x == 994 && tigela2.position.y == 521:
		tigela2.position.y = 547
		return
	else:
			tigela2.position.y = 931
			return
