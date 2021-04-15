extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print("I am in a death screen")

func _on_TryAgainButton_pressed():
	print("Try Again Button is pressed")

	Globals.lvl_control=0 				# Starts on level0
	Globals.points=0 					# Reset Points
	Globals.lifes=Globals.default_lifes	# Reset lifes
	Globals.timer=0 					# Reset timer

	# Reaload Main Screen
	get_tree().change_scene( "res://scenes/Main.tscn" )
