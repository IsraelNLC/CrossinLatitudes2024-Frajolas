extends Node2D


@onready var pause_menu = $pause_menu

var pause_state:bool = false

func _process(delta) -> void:
	if Input.is_action_just_pressed("pause"):
		pause()
	if !pause_state:
		pause_menu.hide()

func pause():
	if pause_state:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	pause_state = !pause_state
