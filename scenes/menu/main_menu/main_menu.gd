extends Control

@onready var frontscreenTexture = $FrontscreenTexture
@onready var mainPanel = $Panel
@onready var returnButton = $Return
@onready var VboxCredits = $VBOXCredits
func _on_play_pressed():
	get_tree().change_scene_to_file('res://scenes/stages/home.tscn')


func _on_options_pressed():
	print('Settings successful!')


func _on_credits_pressed():
	frontscreenTexture.visible = not is_visible_in_tree()
	mainPanel.visible = not is_visible_in_tree()
	returnButton.visible = is_visible_in_tree()
	VboxCredits.visible = is_visible_in_tree()
	print('Credits successful!')




func _on_return_pressed():
	frontscreenTexture.visible = is_visible_in_tree()
	mainPanel.visible = is_visible_in_tree()
	returnButton.visible = not is_visible_in_tree()
	VboxCredits.visible = not is_visible_in_tree()
