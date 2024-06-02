extends Sprite2D

var j = load("res://sprites/ui/j.png")
var jk = load("res://sprites/ui/jk.png")
var jkh = load("res://sprites/ui/jk_hold.png")

func j_press():
	self.texture = j

func jk_press():
	self.texture = jk

func jk_hold():
	self.texture = jkh
