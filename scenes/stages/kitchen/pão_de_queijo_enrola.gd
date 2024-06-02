extends Node2D

@onready var cooking = $cooking

func _ready():
	animacoes()


func animacoes():
	cooking.play("cut")
	await cooking.animation_looped
	cooking.play("roll")
	await cooking.animation_looped
	cooking.play("chease")
	await cooking.animation_looped
	get_tree().change_scene_to_file("res://scenes/stages/homeDEPOISDOpastelESTRANHO.tscn")
