extends RigidBody2D

onready var on_floor=false

func _on_Pumpkin_body_entered(body):
	if body.is_in_group("enemy"):
		self.queue_free()
		body.queue_free()
	elif body.is_in_group("player"):
		# Its fallen (can kill the player)
		if ! self.on_floor:
			# Clean screen enemies
			for enemy in get_tree().get_nodes_in_group("enemy"):
				enemy.queue_free()

			body.is_dead = true
	else:
		self.on_floor=true

func _on_notifier_screen_exited():
	print("Destroy Pumpkin")
	self.queue_free()
