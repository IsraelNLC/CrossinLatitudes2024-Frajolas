extends AnimatedSprite2D

var perfect = false
var good = false
var current_note = null

enum INPUT {
	INPUT01,	# interact1 - J
	INPUT02,	#interact2 - K
	INPUT03,	#interact1 - JK [PRESSED]
}

enum FEEDBACK_STATE {
	PREV_HIT,
	HIT,
	NULL,
}
var feedback_state = FEEDBACK_STATE.NULL
var frame_base = 0 # variavel para id de frame base do input feedback

var notes_in_feedback = 0

@onready var feedback_sprite = $FeedbackInput

@export var input_type : INPUT

var input := 'interact1'

func _ready():
	animation = 'ui'
	match input_type:
		INPUT.INPUT01:
			frame = 0
			input = 'interact1'
			feedback_sprite.frame = 0
			frame_base = feedback_sprite.frame	#sprite inicial do feedback
			feedback_sprite.self_modulate.a = 0
		INPUT.INPUT02:
			frame = 1
			input = 'interact2'
			feedback_sprite.frame = 2
			frame_base = feedback_sprite.frame
			feedback_sprite.self_modulate.a = 0
		INPUT.INPUT03:
			frame = 2
			input = 'interact03'
			feedback_sprite.frame = 4
			frame_base = feedback_sprite.frame
			feedback_sprite.self_modulate.a = 0
		_:
			print('qualquer imputo')
 
func feedback_change():
	if notes_in_feedback > 0:
		if feedback_state == FEEDBACK_STATE.PREV_HIT:
			feedback_sprite.frame = frame_base
			feedback_sprite.self_modulate.a = 0.5
		if feedback_state == FEEDBACK_STATE.HIT:
			feedback_sprite.frame = frame_base + 1
			feedback_sprite.self_modulate.a = 0.9
	else:
		if feedback_state == FEEDBACK_STATE.NULL:
			feedback_sprite.frame = frame_base
			feedback_sprite.self_modulate.a = 0

func _unhandled_input(event):
	if event.is_action(input):
		if event.is_action_pressed(input, false):
			if current_note != null:
				if perfect:
					#get_parent().increment_score(3)
					print('Perfect Note Hit')
					current_note.destroy(3)
					#feedback_change(-1)
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
		
		feedback_state = FEEDBACK_STATE.HIT
		feedback_change()

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


func _on_feedback_area_area_entered(area):
	if area.is_in_group("note"):
		feedback_state = FEEDBACK_STATE.PREV_HIT
		
		#print('Feedback 1 Ativado')
		notes_in_feedback += 1
		feedback_change()


func _on_feedback_area_area_exited(area):
	if area.is_in_group("note"):
		#feedback_state = FEEDBACK_STATE.HIT
		#feedback_change(feedback_state)
		#print('Feedback 2 Ativado')
		feedback_change()



func _on_feedback_area_end_area_entered(area):
	if area.is_in_group('note'):
		feedback_state = FEEDBACK_STATE.NULL
		#print('feedback destroy')
		notes_in_feedback -= 1
		feedback_change()


func _on_feedback_area_end_area_exited(area):
	if area.is_in_group('note'):
		notes_in_feedback -= 1
		feedback_change()
