extends AnimatedSprite2D

var perfect = false
var good = false
var current_note = null

@export var input = ""


func _unhandled_input(event):
	if event.is_action(input):
		if event.is_action_pressed(input, false):
			if current_note != null:
				if perfect:
					#get_parent().increment_score(3)
					print('Perfect Note Hit')
					current_note.destroy(3)
				elif good:
					#get_parent().increment_score(2)
					print('Good Note Hit')					
					current_note.destroy(2)
				_reset()
			else:
				#get_parent().increment_score(0)
				print('None Note Hit')
		if event.is_action_pressed(input):
			frame = 0 #Mudar frame do hit-checker
		elif event.is_action_released(input):
			$PushTimer.start()

func _on_push_timer_timeout():
	frame = 0


func _on_good_area_area_entered(area):
	if area.is_in_group("note"):
		good = true
		current_note = area

func _on_good_area_area_exited(area):
	if area.is_in_group("note"):
		good = false
		current_note = null

func _on_perfect_area_area_entered(area):
	if area.is_in_group("note"):
			perfect = true

func _on_perfect_area_area_exited(area):
	if area.is_in_group("note"):
			perfect = false


func _reset():
	current_note = null
	perfect = false
	good = false
