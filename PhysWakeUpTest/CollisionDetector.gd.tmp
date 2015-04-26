
extends RigidBody2D

var kick_time = 5

func _ready():
	# Initialization here
	connect("body_enter", self, "on_collision")
	connect("body_exit", self, "on_collision_end")
	set_fixed_process(true) # to kick balls in the air sometimes
	pass

func _fixed_process(delta):
	kick_time -= delta
	if(kick_time < 0):
		print("kick")
		kick_time = 3
		#get_owner().get_node("Ball1").set_can_sleep(false) #this line wakeup all things in this particular little scene
		get_owner().get_node("Ball1").apply_impulse(Vector2(0,0), Vector2(0, -100-randi()%20))
		get_owner().get_node("Ball2").apply_impulse(Vector2(0,0), Vector2(0, -100-randi()%20))
		get_owner().get_node("Ball3").apply_impulse(Vector2(0,0), Vector2(0, -100-randi()%20))
		#get_owner().get_node("Ball1").set_can_sleep(true)

func on_collision(object):
	print(object.get_name())
	if(object.has_node("Sprite")):
		object.get_node("Sprite").set_modulate(Color(0.3, 0.3, 0.3))

func on_collision_end(object):
	if(object.has_node("Sprite")):
		object.get_node("Sprite").set_modulate(Color(1, 1, 1))