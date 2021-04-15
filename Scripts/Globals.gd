extends Node

# Score
var hiscore = 100

# Player
var player = null # Player Instante
var pre_player = preload("res://scenes/Player.tscn")

var default_lifes = 1
var lifes = 0

var levels = [
	preload("res://scenes/Level1-1.tscn"),
	preload("res://scenes/Level1-2.tscn")
]

var lvl_control
var current
var timer = 0
var points = 0

func _ready():
	# Start the life counter
	self.lifes = self.default_lifes


func _process(delta):
	# Updates the hiscore
	if self.points > self.hiscore:
		self.hiscore = self.points
