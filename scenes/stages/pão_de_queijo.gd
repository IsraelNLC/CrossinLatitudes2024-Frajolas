extends Node2D

@onready var ralador = $Cooking2
@onready var enrolar = $Cooking3
@onready var misturar = $Cooking

var current_beat = 0

var cenas = [ralador.start_animation(),ralador.play_1(),ralador.play_1(),ralador.play_2(),ralador.play_2(),ralador.play_1(),ralador.play_1(),ralador.play_2(),ralador.play_2(),misturar.start_animation(),misturar.mix_1(),misturar.mix_1(),misturar.mix_1(),misturar.mix_2(),misturar.mix_2(),misturar.mix_2(),ralador.start_animation(),ralador.play_1(),ralador.play_1(),ralador.play_2(),ralador.play_2(),misturar.start_animation(),misturar.mix_1(),misturar.mix_1(),misturar.mix_1(),misturar.mix_2(),misturar.mix_2(),misturar.mix_2(),enrolar.start_animation(),enrolar.enrola_1(),enrolar.enrola_1(),enrolar.stop_animation1(),enrolar.enrola_2(),enrolar.enrola_2(),enrolar.stop_animation2(),ralador.start_animation(),ralador.play_1(),ralador.play_1(),ralador.play_2(),ralador.play_2(),misturar.start_animation(),misturar.mix_1(),misturar.mix_1(),misturar.mix_1(),misturar.mix_2(),misturar.mix_2(),misturar.mix_2(),enrolar.start_animation(),enrolar.enrola_1(),enrolar.stop_animation1(),enrolar.enrola_2(),enrolar.stop_animation2()]
func _ready():
	ralador.start_animation()
