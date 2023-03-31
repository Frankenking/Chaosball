extends Node3D


var rng = RandomNumberGenerator.new()

func _ready():
	$Chaos_Ball1.linear_velocity = Vector3(50, 0, 0)
	$Chaos_Ball2.linear_velocity = Vector3(-50, 0, 0)
	$Chaos_Ball3.linear_velocity = Vector3(0, 0, 50)
	$Chaos_Ball4.linear_velocity = Vector3(0, 0, -50)
	
func _process(delta):
	pass
