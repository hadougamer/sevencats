extends Node2D

func _on_StartButton_pressed():
	print("Lets Start this incredible game")

	Globals.lvl_control=0 				# Starts on level0
	Globals.points=0 					# Reset Points
	Globals.lifes=Globals.default_lifes	# Reset lifes
	Globals.timer=0 					# Reset timer

	# Reaload Main Screen
	get_tree().change_scene( "res://scenes/Main.tscn" )