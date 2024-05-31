extends Node2D

var currentBeatIndex = 0
var beatTimes = [[0.7,1],[1.7,1],[2.5,2],[3.5,1],[4.5,1],[5.5,1]]
var hitDetected = false
var pressingKey = 0

@onready var song = $AudioStreamPlayer
@onready var beatTimer = $Timer
@onready var hitWindow = $TimerHitWindow



# Called when the node enters the scene tree for the first time.
func _ready():
	for i in beatTimes:
		i[0] -= 0.33
	song.play()
	beatTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if currentBeatIndex < beatTimes.size() and song.get_playback_position() >= beatTimes[currentBeatIndex][0]:
		currentBeatIndex += 1
		print("beat")
		hitWindow.start()
		hitDetected = false
	
	if Input.is_action_pressed("press1"):
		pressingKey = 1
	
	if Input.is_action_just_pressed("press1") && Input.is_action_just_pressed("press2"):
		pressingKey = 2
		print(pressingKey)
	
	if pressingKey == 1 and beatTimes[currentBeatIndex-1][1] == 1:
		if not hitWindow.is_stopped() and hitDetected == false:
			hitDetected = true
			pressingKey = 0
			hitWindow.wait_time = 0
		elif hitWindow.is_stopped():
			#print("no notes")
			pressingKey = 0
	elif pressingKey == 2 and beatTimes[currentBeatIndex-1][1] == 2:
		if not hitWindow.is_stopped() and hitDetected == false:
			hitDetected = true
			pressingKey = 0
			hitWindow.wait_time = 0
		elif hitWindow.is_stopped():
			#print("no notes")
			pressingKey = 0

func _on_timer_hit_window_timeout():
	#print("timeout")
	pressingKey = 0
	if hitDetected == true:
		print("Hited")
	else:
		print("no hit")
