extends Node2D

@onready var globalvars = $"/root/Globalvars"
@onready var _animated_sprite = $VéiaAnimada
@onready var pause_menu = $pause_menu

var pause_state:bool = false

func _process(delta) -> void:
	if Input.is_action_just_pressed("pause"):
		pause()
	if !pause_state:
		pause_menu.hide()
	if globalvars.pastel:
		get_tree().change_scene_to_file("res://scenes/stages/kitchen/pastel_corte.tscn")
		globalvars.pastel = false
	if (globalvars.paodequeijo == true):
		get_tree().change_scene_to_file("res://scenes/stages/pão_de_queijo.tscn")
		globalvars.paodequeijo = false
	if (globalvars.lastdialogueover == true):
		get_tree().change_scene_to_file("res://scenes/stages/cutscenefinal.tscn")


func pause():
	if pause_state:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	pause_state = !pause_state
