extends Node

# Score
var hiscore = 0

# Camera
var camera = null

# Windows Size
var win_width = 1024
var win_height = 768

# Player
var player = null # Player Instante
var pre_player = preload("res://scenes/Player.tscn")

var default_lifes = 7
var lifes = 0

var levels = [
	#preload("res://scenes/Level1-1.tscn"),
	#preload("res://scenes/Level1-2.tscn"),
	#preload("res://scenes/Level1-3.tscn"),
	preload("res://scenes/Level2-1.tscn"),
	preload("res://scenes/Level2-1.tscn")
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
