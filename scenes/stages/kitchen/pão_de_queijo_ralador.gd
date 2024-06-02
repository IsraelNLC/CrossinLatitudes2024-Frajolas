extends Node2D

@onready var ralador1 = $ralador_npc
@onready var ralador2 = $ralador_player
@onready var tigela1 = $tigela_npc
@onready var tigela2 = $tigela_player

@onready var main = $"../"

var played1 = false
var played2 = false

func start_animation():
	main.enrolar.visible = false
	main.misturar.visible = false
	main.ralador.visible = true

func play_1():
	if  played1:
		tigela1.frame = 1
	ralador1.play("default")
	played1 = true
	await ralador1.animation_looped
	ralador1.stop()
	return 1

func play_2():
	if  played2:
		tigela2.frame = 1
	ralador2.play("default")
	tigela2.frame = 1
	await ralador2.animation_looped
	ralador2.stop()
	return 1
