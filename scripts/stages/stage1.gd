extends Node2D

var currentBeatIndex = 0
var beatTimes = [[0.8,0.8,1],[1.6,1.6,1],[2.5,3.0,2],[3.5,3.5,1],[4.5,4.5,1],[5.4,6.4,2]]

@onready var beat = preload("res://scenes/common/beat.tscn")

@onready var song = $AudioStreamPlayer
@onready var beatTimer = $Timer

var onBeat = false

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in beatTimes:
		i[0] -= 0.2
		i[1] -= 0.20
	song.play()
	beatTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if currentBeatIndex > beatTimes.size() -1:
		onBeat = true
	if onBeat == false and song.get_playback_position() >= beatTimes[currentBeatIndex][0]:
		print(beatTimes[currentBeatIndex][0])
		var newBeat = beat.instantiate()
		newBeat.key = beatTimes[currentBeatIndex][2]
		newBeat.start = beatTimes[currentBeatIndex][0]
		newBeat.end = beatTimes[currentBeatIndex][1]
		add_child(newBeat)
		newBeat.beatSignal.connect(beatDone)
		onBeat = true

func beatDone(state):
	currentBeatIndex += 1
	onBeat = false
	print(state)
