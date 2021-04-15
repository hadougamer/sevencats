extends Node2D

func _ready():
	$Audio.play()
	start()

# starts all configs	
func start():	
	start_interface()
	start_player()
	start_level()

func start_interface():
	$Interface.set_lifes(Globals.lifes)
	$Interface.load_lifes()

func start_level():
	loadLevel(0, 0, 0)

func start_player():
	# Add Player
	Globals.player = Globals.pre_player.instance()
	Globals.player.position = $PlayerPos.position
	add_child(Globals.player)

func _process(delta):
	if Globals.player != null:
		# Delete old levels
		var lvlsLoaded = get_tree().get_nodes_in_group("level")
		if( lvlsLoaded.size() > 2 ):
			lvlsLoaded[0].queue_free()
		
		print("Levels loaded: " + String( lvlsLoaded.size() ) )
		print("Lifes: " + String( Globals.lifes ) )

		# Points
		if Globals.timer < 60:
			Globals.timer+=1
		else:
			Globals.points+=5
			Globals.timer=0

		$Camera.position.x += 5
		$Interface.position.x = ($Camera.position.x - 520)
		$PlayerPos.position.x = ($Camera.position.x - 100)
		$Interface.setPoints( Globals.points )
	else:
		#Globals.points=0 	# reset pts
		
		# Update lifes
		Globals.lifes-=1 	# substract life
		$Interface.set_lifes(Globals.lifes)
		$Interface.load_lifes()
		
		if Globals.lifes <= 0:
			# Load Death Screen
			$Audio.stop()
			get_tree().change_scene( "res://scenes/Death.tscn" )
			return

		start_player()

func loadLevel(num, x, y):
	var lastLevel = (Globals.levels.size() - 1)
	Globals.lvl_control = num

	# Reset the loop
	if( num > lastLevel  ):
		Globals.lvl_control = 0

	Globals.current = Globals.levels[Globals.lvl_control].instance()
	Globals.current.position.x = x
	Globals.current.position.y = y
	
	add_child(Globals.current)
