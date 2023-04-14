extends RigidBody3D

var velocity = Vector3()
var collision_pos = Vector3()

func input():
	if Input.is_action_pressed("forward"):
		velocity.z = -75
	elif Input.is_action_pressed("back"):
		velocity.z = 75
	else:
		velocity.z = 0
		
	if Input.is_action_pressed("left"):
		velocity.x = -75
	elif Input.is_action_pressed("right"):
		velocity.x = 75
	else:
		velocity.x = 0
	
	
	return velocity
		
func _process(delta):
	if $roll.playing == false:
		$roll.playing = true
	if abs($".".linear_velocity[0]) > 0 or abs($".".linear_velocity[2]) > 0:
		$roll.volume_db = -30 + abs($".".linear_velocity[0]) + abs($".".linear_velocity[2])
		$roll.pitch_scale = 1 + abs($".".linear_velocity[0])*0.01 + abs($".".linear_velocity[2])*0.01
	else:
		$roll.volume_db = -60
	velocity = input()
	$".".constant_force = velocity
	
