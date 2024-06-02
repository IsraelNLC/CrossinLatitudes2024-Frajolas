extends Node2D

@onready var ralador = $Cooking2
@onready var enrolar = $Cooking3
@onready var misturar = $Cooking

var current_beat = 0

#var cenas = [ralador.start_animation(),ralador.play_1(),ralador.play_1(),ralador.play_2(),ralador.play_2(),ralador.play_1(),ralador.play_1(),ralador.play_2(),ralador.play_2(),misturar.start_animation(),misturar.mix_1(),misturar.mix_1(),misturar.mix_1(),misturar.mix_2(),misturar.mix_2(),misturar.mix_2(),ralador.start_animation(),ralador.play_1(),ralador.play_1(),ralador.play_2(),ralador.play_2(),misturar.start_animation(),misturar.mix_1(),misturar.mix_1(),misturar.mix_1(),misturar.mix_2(),misturar.mix_2(),misturar.mix_2(),enrolar.start_animation(),enrolar.enrola_1(),enrolar.enrola_1(),enrolar.stop_animation1(),enrolar.enrola_2(),enrolar.enrola_2(),enrolar.stop_animation2(),ralador.start_animation(),ralador.play_1(),ralador.play_1(),ralador.play_2(),ralador.play_2(),misturar.start_animation(),misturar.mix_1(),misturar.mix_1(),misturar.mix_1(),misturar.mix_2(),misturar.mix_2(),misturar.mix_2(),enrolar.start_animation(),enrolar.enrola_1(),enrolar.stop_animation1(),enrolar.enrola_2(),enrolar.stop_animation2()]
var cenas = [0,1,1,2,2,3,4,5,4,5]

func _ready():
	start_sequence()
	#ralador.play_2()

func start_sequence():
	#for current_beat in cenas:
	if cenas[current_beat] == 0:
		ralador.start_animation()
	elif cenas[current_beat] == 1:
		print("animacao1")
		if await ralador.play_1() == 1:
			print("finnished")
	elif cenas[current_beat] == 2:
		print("animacao2")
		if await ralador.play_2() == 2:
			print("finnished")
	elif cenas[current_beat] == 3:
		misturar.start_animation()
	elif cenas[current_beat] == 4:
		misturar.mix_1()
	elif cenas[current_beat] == 5:
		misturar.mix_2()
	current_beat += 1
