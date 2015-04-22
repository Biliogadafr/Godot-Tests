
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

var oldIntersect 

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	#moving
	var move_left = Input.is_action_pressed("move_left")
	var move_right = Input.is_action_pressed("move_right")
	var move_up = Input.is_action_pressed("move_up")
	var move_down = Input.is_action_pressed("move_down")
	var direction = Vector2(move_right-move_left, move_down - move_up)
	direction = direction.normalized()
	direction*=delta*5000
	set_linear_velocity(direction)
	
	#ray cast
	var space = get_world_2d().get_space()
	var physWorld = Physics2DServer.space_get_direct_state( space )
	var intersectResult = physWorld.intersect_ray(Vector2(0,0), get_global_pos())
	oldIntersect = intersectResult
	update()
	
func _draw():
	pass
	if(oldIntersect != null && oldIntersect.has("position")):
		draw_line( get_global_transform().xform_inv(Vector2(0,0)),  get_global_transform().xform_inv(oldIntersect["position"]), Color(1,1,1))
	