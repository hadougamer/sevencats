extends Node2D

var lifes=7
var points=0
var pre_heart = preload("res://scenes/heart.tscn")

func _ready():
	load_lifes()

func set_lifes(num):
	self.lifes=num

func load_lifes():
	if self.lifes < 0:
		print('No more lifes!')
		return

	clear_hearts()

	var posx = 0
	for i in range(self.lifes):
		if i == 0:
			posx = $HeartPos.position.x
		else:
			posx -= 25
		
		var heart = pre_heart.instance()
		
		heart.position.x = posx
		heart.position.y = $HeartPos.position.y
		add_child(heart)

func clear_hearts():
	for heart in get_tree().get_nodes_in_group("heart"):
		heart.queue_free()

func _process(delta):
	$"Control/PointsLabel".text=String(self.points)
	$"Control/HiscoreLabel".text="HI - " + String(Globals.hiscore)
	
func setPoints( pts ):
	self.points=pts
