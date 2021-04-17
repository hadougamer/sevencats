extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const SPEED = 300
const JUMP_HEIGHT = -650

var v_multi = 1 #Velocity multiplier
var motion  = Vector2()
var cleared = false
var is_dead = false

func _ready():
	$Sprite.flip_h = true

func _physics_process(delta):
	if ! is_dead:
		motion.y += GRAVITY

		# Velocity impulse
		if Input.is_action_pressed('ui_right'):
			v_multi = 1.05
		elif Input.is_action_pressed('ui_left'):
			v_multi = -0.025
		else:
			v_multi = 1

		$Sprite.flip_h = true
		$Sprite.play('walking')

		motion.x = SPEED * v_multi

		# Verify the collision
		self.check_collision()
		
		if is_on_floor():
			if Input.is_action_pressed("ui_jump"):
				motion.y = JUMP_HEIGHT
		else:
			$Sprite.play('jump')

		motion = move_and_slide(motion, UP)
	else:
		$Sprite.play('die')

func check_collision():
	# Collision
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider and collider.is_in_group("enemy"):
			# Clean screen enemies
			for enemy in get_tree().get_nodes_in_group("enemy"):
				enemy.queue_free()
			
			is_dead = true

func die():
	self.queue_free()

func _on_visible_screen_exited():
	print('Player exited the screen')
	if self.position.x < Globals.camera.position.x: 
		self.die()
	else:
		self.position.x = (Globals.camera.position.x + 540)

func _on_Sprite_animation_finished():
	var anim  = $Sprite.get_animation()
	if anim == "die":
		self.die()
