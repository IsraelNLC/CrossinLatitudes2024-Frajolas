extends Node2D

var score = 0
var combo = 0

var max_combo = 0
var great = 0
var good = 0
#var okay = 0
var missed = 0

var bpm = 130

var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat = 60.0 / bpm

var spawn_1_beat = 0
var spawn_2_beat = 1
var spawn_3_beat = 0
var spawn_4_beat = 1

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

func _on_conductor_sig_beat(_position):
	song_position_in_beats = _position
	print(_position)
	if song_position_in_beats > 36:
		print('beat 1 start')
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats > 98:
		print('beat 2 start')
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats > 132:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats > 162:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats > 194:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
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
	if to_spawn > 0:
		lane = randi() % 3
		instance = note.instantiate()
		instance.initialize(lane)
		add_child(instance)
	if to_spawn > 1:
		while rand == lane:
			rand = randi() % 3
		lane = rand
		instance = note.instantiate()
		instance.initialize(lane)
		add_child(instance)

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



