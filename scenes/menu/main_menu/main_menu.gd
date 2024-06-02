extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file('res://scenes/stages/home.tscn')


func _on_options_pressed():
	print('Settings successful!')


func _on_credits_pressed():
	print('Credits successful!')

