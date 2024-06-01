extends Node

var key = 1
var start = 0
var end = 0
var duration = end - start
var continuous = false
var continuousHittedFirst = false
var releasable = false
var buttonPressing = 0

signal beatSignal(state)

@onready var hitWindow = $startBeatHitWindow
@onready var endHitWindow = $endBeatHitWindow
@onready var buttonTimer = $buttonTimer
@onready var finnishGap = $finnishGap


# Called when the node enters the scene tree for the first time.
func _ready():
	duration = end - start
	if duration != 0:
		continuous = true
	hitWindow.start()
	if continuous == true:
		endHitWindow.wait_time = duration - 0.3
		endHitWindow.start()
	print("DURACAO: ",key,"'", start,"'", end,"'", duration,"'", continuous)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("press1") or Input.is_action_just_pressed("press2") or Input.is_action_just_released("press1") or Input.is_action_just_released("press2"):
		buttonTimer.start()
	
	if key == 1 and continuous == false:
		if buttonPressing == 1:
			doneBeat(true)
	elif key == 2 and continuous == false:
		if buttonPressing == -1:
			doneBeat(true)
	elif key == 2 and continuous == true:
		#print(buttonPressing)
		if buttonPressing == -1:
			continuousHittedFirst = true
		elif releasable == true and buttonPressing == 0:
			doneBeat(true)
		elif buttonPressing != -1 and hitWindow.is_stopped():
			doneBeat(false)
		else: 
			continuousHittedFirst = false


func _on_button_timer_timeout():
	buttonPressing = Input.get_action_strength("press1") - Input.get_action_strength("press2")*2
	#print(buttonPressing)

func _on_start_beat_hit_window_timeout():
	if continuous == false:
		doneBeat(false)
	elif continuous == true and continuousHittedFirst == false:
		doneBeat(false)

func doneBeat(hittedState):
	#print(hittedState)
	emit_signal("beatSignal", hittedState)
	queue_free()

func _on_end_beat_hit_window_timeout():
	releasable = true
	finnishGap.start()

func _on_finnish_gap_timeout():
	doneBeat(false)
