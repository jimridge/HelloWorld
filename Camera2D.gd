extends Camera2D

onready var player = get_node("/root/MainScene/Player")
#var update_y_position : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
#	set_enable_follow_smoothing(true) #smooth or no smooth
#	set_follow_smoothing(20) #How much smoothing you want
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
#	position.x = player.position.x
#	update_y_position = true
#	if Input.is_action_just_pressed("jump"):
#		update_y_position = false
#
#	if update_y_position:
#		position.y = player.position.y
#	align()
