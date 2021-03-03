extends KinematicBody2D


# stats

var score : int = 0
var health : int = 3

# physics

var jump_count = 0

var speed : int = 200
var jumpForce : int = 300 # 600 original value # 300 seems about right
var max_jumps : int = 1
var gravity : int = 1200 # 800 original value

var vel : Vector2 = Vector2()
var grounded : bool = false

# components
onready var sprite = $Sprite



# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process (delta):


	# reset horizontal velocity
	vel.x = 0
	# movement inputs
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed

	# applying the velocity
	vel = move_and_slide(vel, Vector2.UP)

	# gravity
	vel.y += gravity * delta

	# jump input
	if Input.is_action_just_pressed("jump"):
		$AnimationPlayer.play("jump")
		if is_on_floor():
			vel.y -= jumpForce
			jump_count = 0


		elif !is_on_floor() and jump_count < max_jumps:
			vel.y -= jumpForce
			jump_count += 1

	# sprite direction
	if vel.x < 0:
		$AnimationPlayer.play("run_right")
		sprite.flip_h = true
	elif vel.x > 0:
		sprite.flip_h = false
		$AnimationPlayer.play("run_right")
	elif vel.x == 0:
		$AnimationPlayer.play("idle")







## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
##	pass
