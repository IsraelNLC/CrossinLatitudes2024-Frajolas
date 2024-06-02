extends Node2D

@onready var tigela1 = $hand_npc
@onready var tigela2 = $hand_player

@onready var main = $"../"

func start_animation():
	main.enrolar.visible = false
	main.ralador.visible = false
	main.misturar.visible = true

func mix_1():
	if tigela1.x == 291:
		if tigela1.y == 521:
			tigela1.x = 354
			return
		else:
			tigela1.y = 521
			return
	elif tigela1.x ==354 && tigela1.y == 521:
		tigela1.y = 547
		return
	else:
			tigela1.x = 521
			return
			
func mix_2():
	if tigela2.x == 931:
		if tigela2.y == 521:
			tigela2.x = 994
			return
		else:
			tigela2.y = 931
			return
	elif tigela2.x == 994 && tigela2.y == 521:
		tigela2.y = 547
		return
	else:
			tigela2.x = 931
			return
