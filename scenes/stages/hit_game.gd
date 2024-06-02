extends Node2D

var score = 0
var combo = 0

var max_combo = 0
var great = 0
var good = 0
#var okay = 0
var missed = 0

var bpm = 100

var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat = 60.0 / bpm

var spawn_1_beat = [0,0]
var spawn_2_beat = [0,0]
var spawn_3_beat = [0,0]
var spawn_4_beat = [0,0]
var spawn_5_beat = [0,0]
var spawn_6_beat = [0,0]
var spawn_7_beat = [0,0]
var spawn_8_beat = [0,0]

var beat_hit = [10, 12, 14, 16, 18, 20, 22, 24, 26, 27, 28, 30, 31, 32, 34, 36, 38, 40, 42, 43, 44, 46, 47, 48, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 79, 80, 82, 83, 84, 86, 88, 90, 92]

var beat_anima = [1, 1, 2, 2, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 1, 1, 2, 2, 1, 1, 1, 2, 2, 2, 5, 5, 6, 6, 5, 5, 6, 6, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 6, 6]

#var beat_tempo = [4, 8, 4, 8, 4, 8, 4, 8, 4, 6, 8, 4, 6, 8, 4, 8, 4, 8, 4, 6, 8, 4, 6, 8, 4, 8, 4, 8, 4, 8, 4, 8, 4, 8, 4, 8, 4, 6, 8, 4, 6, 8, 4, 8, 4, 8, 4, 8]
var beat_tempo = [3, 7, 3, 7, 3, 7, 5, 7, 3, 5, 7, 3, 5, 7, 3, 7, 3, 7, 3, 5, 7, 3, 5, 7, 3, 7, 3, 7, 3, 7, 3, 7, 3, 7, 3, 5, 7, 3, 5, 7, 3, 7, 3, 7, 3, 7]


var lane = 0
var rand = 0
var note = load("res://scenes/common/beat_system/note/note.tscn")
var instance

func _ready():
	#print('hit game start')
	randomize()
	$Conductor.play_with_beat_offset(8)

#func _input(event):
	#if event.is_action("escape"):
		#if get_tree().change_scene_to_file("res://Scenes/Menu.tscn") != OK:
			#print ("Error changing scene to Menu")

func _on_conductor_sig_measure(_position):
	if _position == 1:
		_spawn_notes(spawn_1_beat)
	elif _position == 2:
		_spawn_notes(spawn_2_beat)
	elif _position == 3:
		_spawn_notes(spawn_3_beat)
	elif _position == 4:
		_spawn_notes(spawn_4_beat)
	elif _position == 5:
		_spawn_notes(spawn_5_beat)
	elif _position == 6:
		_spawn_notes(spawn_6_beat)
	elif _position == 7:
		_spawn_notes(spawn_7_beat)
	elif _position == 8:
		_spawn_notes(spawn_8_beat)

func _on_conductor_sig_beat(_position):
	song_position_in_beats = _position
	#print('signal beat: ', _position)
	for beat in beat_anima.size():
		if song_position_in_beats == beat_hit[beat]:
			print('beat de spawn nota ', _position)
			print('beat da action: ', beat_anima[beat])
			print('beat do tempo: ', beat_tempo[beat])
	
	if song_position_in_beats >= 0 and song_position_in_beats < 8:
		spawn_1_beat = [0,0]
		spawn_2_beat = [0,0]
		spawn_3_beat = [0,0]
		spawn_4_beat = [0,0]
		spawn_5_beat = [0,0]
		spawn_6_beat = [0,0]
		spawn_7_beat = [0,0]
		spawn_8_beat = [0,0]
	if song_position_in_beats >= 8 and song_position_in_beats < 16:
		spawn_1_beat = [0,0]
		spawn_2_beat = [0,0]
		spawn_3_beat = [0,0]
		spawn_4_beat = [0,0]
		spawn_5_beat = [0,0]
		spawn_6_beat = [0,0]
		spawn_7_beat = [0,0]
		spawn_8_beat = [0,0]
	if song_position_in_beats >= 16 and song_position_in_beats < 24:
		spawn_1_beat = [0,0]
		spawn_2_beat = [0,0]
		spawn_3_beat = [1,0]
		spawn_4_beat = [0,0]
		spawn_5_beat = [0,0]
		spawn_6_beat = [0,0]
		spawn_7_beat = [1,0]
		spawn_8_beat = [0,0]
	if song_position_in_beats >= 24 and song_position_in_beats < 32:
		spawn_1_beat = [0,0]
		spawn_2_beat = [0,0]
		spawn_3_beat = [1,0]
		spawn_4_beat = [0,0]
		spawn_5_beat = [0,0]
		spawn_6_beat = [0,0]
		spawn_7_beat = [1,0]
		spawn_8_beat = [0,0]
	if song_position_in_beats >= 32 and song_position_in_beats < 40:
		spawn_1_beat = [0,0]
		spawn_2_beat = [0,0]
		spawn_3_beat = [1,0]
		spawn_4_beat = [0,0]
		spawn_5_beat = [0,0]
		spawn_6_beat = [0,0]
		spawn_7_beat = [1,0]
		spawn_8_beat = [0,0]
	if song_position_in_beats >= 40 and song_position_in_beats < 48:
		spawn_1_beat = [0,0]
		spawn_2_beat = [0,0]
		spawn_3_beat = [1,0]
		spawn_4_beat = [0,0]
		spawn_5_beat = [0,0]
		spawn_6_beat = [0,0]
		spawn_7_beat = [1,0]
		spawn_8_beat = [0,0]
	if song_position_in_beats >= 48 and song_position_in_beats < 56:
		spawn_1_beat = [0,0]
		spawn_2_beat = [0,0]
		spawn_3_beat = [1,1]
		spawn_4_beat = [0,0]
		spawn_5_beat = [1,1]
		spawn_6_beat = [0,0]
		spawn_7_beat = [1,1]
		spawn_8_beat = [0,0]
	if song_position_in_beats >= 56 and song_position_in_beats < 64:
		spawn_1_beat = [0,0]
		spawn_2_beat = [0,0]
		spawn_3_beat = [1,1]
		spawn_4_beat = [0,0]
		spawn_5_beat = [1,1]
		spawn_6_beat = [0,0]
		spawn_7_beat = [1,1]
		spawn_8_beat = [0,0]
	if song_position_in_beats >= 64 and song_position_in_beats < 72:
		spawn_1_beat = [0,0]
		spawn_2_beat = [0,0]
		spawn_3_beat = [1,0]
		spawn_4_beat = [0,0]
		spawn_5_beat = [0,0]
		spawn_6_beat = [0,0]
		spawn_7_beat = [1,0]
		spawn_8_beat = [0,0]
	if song_position_in_beats >= 72 and song_position_in_beats < 80:
		spawn_1_beat = [0,0]
		spawn_2_beat = [0,0]
		spawn_3_beat = [1,0]
		spawn_4_beat = [0,0]
		spawn_5_beat = [0,0]
		spawn_6_beat = [0,0]
		spawn_7_beat = [1,0]
		spawn_8_beat = [0,0]
	if song_position_in_beats >= 80 and song_position_in_beats < 88:
		spawn_1_beat = [0,0]
		spawn_2_beat = [0,0]
		spawn_3_beat = [1,0]
		spawn_4_beat = [0,0]
		spawn_5_beat = [0,0]
		spawn_6_beat = [0,0]
		spawn_7_beat = [1,0]
		spawn_8_beat = [0,0]
	if song_position_in_beats >= 88 and song_position_in_beats < 96:
		spawn_1_beat = [0,0]
		spawn_2_beat = [0,0]
		spawn_3_beat = [1,0]
		spawn_4_beat = [0,0]
		spawn_5_beat = [0,0]
		spawn_6_beat = [0,0]
		spawn_7_beat = [1,0]
		spawn_8_beat = [0,0]
	if song_position_in_beats >= 96 and song_position_in_beats < 104:
		spawn_1_beat = [0,0]
		spawn_2_beat = [0,0]
		spawn_3_beat = [1,0]
		spawn_4_beat = [0,0]
		spawn_5_beat = [0,0]
		spawn_6_beat = [0,0]
		spawn_7_beat = [1,0]
		spawn_8_beat = [0,0]

	
	if song_position_in_beats > 200:
		print('Fim da Musica')
		#Global.set_score(score)
		#Global.combo = max_combo
		#Global.great = great
		#Global.good = good
		#Global.okay = okay
		#Global.missed = missed
		if get_tree().change_scene_to_file("res://scenes/stages/home.tscn") != OK:
			print ("Error changing scene to End")

func _spawn_notes(to_spawn):
	#print('spawnei nota')
	if to_spawn[0] > 0:
		lane = to_spawn[1]
		instance = note.instantiate()
		instance.initialize(lane)
		add_child(instance)
	if to_spawn[0] > 1:
		lane = to_spawn[1]
		instance = note.instantiate()
		instance.initialize(lane)
		add_child(instance)
	if to_spawn[0] == 0:
		print('sem notas to spawn')

#func increment_score(by):
	#if by > 0:
		#combo += 1
	#else:
		#combo = 0
	#
	#if by == 3:
		#great += 1
	#elif by == 2:
		#good += 1
	#elif by == 1:
		#okay += 1
	#else:
		#missed += 1
	#
	#score += by * combo
	#$Label.text = str(score)
	#if combo > 0:
		#$Combo.text = str(combo) + " combo!"
		#if combo > max_combo:
			#max_combo = combo
	#else:
		#$Combo.text = ""
#
#func reset_combo():
	#combo = 0
	#$Combo.text = ""



