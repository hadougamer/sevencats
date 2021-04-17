extends Node2D
var lnum = 2

func _on_lpos_notifier_screen_exited():
	print("Load level " + str(1))

	var main = $"../" 
	var rect = Globals.current.get_node("TileMap").get_used_rect()
	var posx = Globals.current.position.x + (rect.size.x * 32)

	main.loadLevel(lnum+1, posx, 0)
