extends Control

@onready var scene = $"../"

func _on_resume_pressed():
	scene.pause()



func _on_quit_pressed():
	get_tree().quit()
