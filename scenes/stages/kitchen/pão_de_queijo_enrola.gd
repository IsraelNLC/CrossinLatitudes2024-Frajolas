extends Node2D

@onready var mao1 = $hand_npc
@onready var pao1 = $massa_npc
@onready var mao2 = $hand_player
@onready var pao2 = $massa_player

@onready var main = $"../"

func start_animation():
	main.enrolar.visible = true
	main.ralador.visible = false
	main.misturar.visible = false



func enrola_1():
	mao1.play("holding")
	pao1.play("default")

func enrola_2():
	mao2.play("holding")
	pao2.play("default")

func stop_animation1():
	mao1.stop()
	mao1.frame = 0
	pao1.stop()
	pao1.frame = 5

func stop_animation2():
	mao2.stop()
	mao2.frame = 0
	pao2.stop()
	pao2.frame = 5
