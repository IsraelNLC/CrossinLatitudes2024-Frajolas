extends Node2D


@onready var tigela1 = $hand_npc
@onready var tigela2 = $hand_player

@onready var main = $"../"

@onready var timer = $timerAnim
@onready var timer2 = $timerAnim2

#var nextStage1 = 1
#var nextStage2 = 1

func start_animation():
	main.enrolar.visible = false
	main.ralador.visible = false
	main.misturar.visible = true

func mix_1(stage1):
	timer.wait_time = 0.5
	var pos11 = Vector2(291,521)
	var pos12 = Vector2(354,521)
	var pos13 = Vector2(354,547)
	
	if stage1 == 1:
		timer.start()
		await timer.timeout
		tigela1.position = pos11
		return 2
	if stage1 == 2:
		timer.start()
		await timer.timeout
		tigela1.position = pos12
		return 3
	if stage1 == 3:
		timer.start()
		await timer.timeout
		tigela1.position = pos13
		return 1


func mix_2(stage2):
	timer2.wait_time = 0.5
	var pos21 = Vector2(931,521)
	var pos22 = Vector2(994,521)
	var pos23 = Vector2(994,547)
	
	if stage2 == 1:
		timer2.start()
		await timer2.timeout
		tigela2.position = pos21
		return 2
	if stage2 == 2:
		timer2.start()
		await timer2.timeout
		tigela2.position = pos22
		return 3
	if stage2 == 3:
		timer2.start()
		await timer2.timeout
		tigela2.position = pos23
		return 1




