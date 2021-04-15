extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const SPEED = 300
const JUMP_HEIGHT = -650

var v_multi = 1 #Velocity multiplier
var motion  = Vector2()
var cleared = false

func _ready():
	$Sprite.flip_h = true

func _physics_process(delta):
	motion.y += GRAVITY
	
	# Velocity impulse
	if Input.is_action_pressed('ui_right'):
		v_multi = 1.05
	elif Input.is_action_pressed('ui_left'):
		v_multi = 0.9
	else:
		v_multi = 1

	$Sprite.flip_h = true
	$Sprite.play('walking')

	motion.x = SPEED * v_multi

	if is_on_floor():
		if Input.is_action_pressed("ui_jump"):
			motion.y = JUMP_HEIGHT
	else:
		$Sprite.play('jump')

	motion = move_and_slide(motion, UP)

func die():
	print('Player is dead!')
	self.queue_free()

func _on_visible_screen_exited():
	print('Player exited the screen')
	if self.position.x < Globals.camera.position.x: 
		self.die()
	else:
		self.position.x = (Globals.camera.position.x + 540)
