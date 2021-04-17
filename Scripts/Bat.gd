extends Node2D

func _process(delta):
	if Globals.player:
		if self.position.y < Globals.player.position.y:
			self.position.y += 0.3
		if self.position.y > Globals.player.position.y:
			self.position.y -= 0.3

func _on_notifier_screen_exited():
	print("Bat exited screen")
	self.queue_free()
