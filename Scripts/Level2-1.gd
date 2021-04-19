extends Node2D
var lnum = 0

func _on_lpos_notifier_screen_exited():
	print("Load level " + str(lnum))

	var main = $"../" 
	var rect = Globals.current.get_node("TileMap").get_used_rect()
	var posx = Globals.current.position.x + (rect.size.x * 64)

	main.loadLevel(lnum+1, posx, 0)
