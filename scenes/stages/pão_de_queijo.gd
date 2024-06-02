extends Node2D

@onready var ralador = $Cooking2
@onready var enrolar = $Cooking3
@onready var misturar = $Cooking

var mixStage1 = 1
var mixStage2 = 1

#var current_beat = 0

#var cenas = [ralador.start_animation(),ralador.play_1(),ralador.play_1(),ralador.play_2(),ralador.play_2(),ralador.play_1(),ralador.play_1(),ralador.play_2(),ralador.play_2(),misturar.start_animation(),misturar.mix_1(),misturar.mix_1(),misturar.mix_1(),misturar.mix_2(),misturar.mix_2(),misturar.mix_2(),ralador.start_animation(),ralador.play_1(),ralador.play_1(),ralador.play_2(),ralador.play_2(),misturar.start_animation(),misturar.mix_1(),misturar.mix_1(),misturar.mix_1(),misturar.mix_2(),misturar.mix_2(),misturar.mix_2(),enrolar.start_animation(),enrolar.enrola_1(),enrolar.enrola_1(),enrolar.stop_animation1(),enrolar.enrola_2(),enrolar.enrola_2(),enrolar.stop_animation2(),ralador.start_animation(),ralador.play_1(),ralador.play_1(),ralador.play_2(),ralador.play_2(),misturar.start_animation(),misturar.mix_1(),misturar.mix_1(),misturar.mix_1(),misturar.mix_2(),misturar.mix_2(),misturar.mix_2(),enrolar.start_animation(),enrolar.enrola_1(),enrolar.stop_animation1(),enrolar.enrola_2(),enrolar.stop_animation2()]
var cenas = [0,1,1,2,2,1,1,2,2,3,4,4,4,5,5,5,0,1,1,2,2,3,4,4,4,5,5,5,6,7,9,7,9,0,1,1,2,2,3,4,4,4,5,5,5,6,7,9]
#var cenas = [3,4,4,4,5,5,5,0,1,1,2,2,3,4,4,4,5,5,5,6,7,8,9,10,7,8,9,10,0,1,1,2,2,3,4,4,4,5,5,5,6,7,8,9,10]
#enrolar.start_animation(),enrolar.enrola_1(),enrolar.enrola_1(),enrolar.stop_animation1(),enrolar.enrola_2()
func _ready():
	start_sequence()

func start_sequence():
	for current_beat in cenas:
		print(current_beat)
		if current_beat == 0:
			ralador.start_animation()
		elif current_beat == 1:
			print("animacao1")
			if await ralador.play_1() == 1:
				print("finnished")
		elif current_beat == 2:
			print("animacao2")
			if await ralador.play_2() == 2:
				print("finnished")
		elif current_beat == 3:
			misturar.start_animation()
		elif current_beat == 4:
			mixStage1 = await misturar.mix_1(mixStage1)
			print("finnishedmix1")
		elif current_beat == 5:
			mixStage2 = await misturar.mix_2(mixStage2)
			print("finnishedmix2")
		elif current_beat == 6:
			enrolar.start_animation()
		elif current_beat == 7:
			enrolar.enrola_1()
		#elif current_beat == 8:
			#enrolar.stop_animation1()
		elif current_beat == 9:
			enrolar.enrola_2()
		#elif current_beat == 10:
			#enrolar.stop_animation2()
	#current_beat += 1
