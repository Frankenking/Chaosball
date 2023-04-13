extends RigidBody3D

var velocity = Vector3()
var collision_pos = Vector3()

func input():
	if Input.is_action_pressed("forward"):
		velocity.z = -150
	elif Input.is_action_pressed("back"):
		velocity.z = 150
	else:
		velocity.z = 0
		
	if Input.is_action_pressed("left"):
		velocity.x = -150
	elif Input.is_action_pressed("right"):
		velocity.x = 150
	else:
		velocity.x = 0
	
	
	return velocity
		
func _process(delta):
	velocity = input()
	$".".constant_force = velocity
	
