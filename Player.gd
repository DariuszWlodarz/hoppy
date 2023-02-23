extends KinematicBody2D

var motion = Vector2(0,0)
const SPEED = 1000
const GRAVITY = 300
const UP = Vector2(0,-1)
const JUMP_SPEED = 3000
const WORLD_LIMIT = 4000
const BOOST_MULTIPLAYER = 2
var lives = 3

signal animate

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	
	
	move_and_slide(motion, UP)

func apply_gravity():
	if position.y > WORLD_LIMIT:
		end_game()
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY
func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED
		$JumpSFX.play()
		
func move():
	var inputLeft = Input.is_action_pressed("left")
	var inputRight = Input.is_action_pressed("right")
	if inputLeft and not inputRight:
		motion.x = -SPEED
	elif inputRight and not inputLeft:
		motion.x = SPEED
	else:
		motion.x = 0
		
func animate():
	emit_signal("animate", motion)
	
func end_game():
	get_tree().change_scene("res://levels/GameOver.tscn")
#
func hurt():
	position.y -= 3
	yield(get_tree(), "idle_frame")
	motion.y -= JUMP_SPEED
	lives -= 1
	$PainSFX.play()
	if lives < 0:
		end_game()
		
func boost():
	position.y -= 3
	yield(get_tree(), "idle_frame")
	motion.y -= JUMP_SPEED * BOOST_MULTIPLAYER
