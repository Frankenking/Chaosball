extends Node3D

var rng = RandomNumberGenerator.new()
var rng2 = RandomNumberGenerator.new()

var multiplier = 0

var randnum1 = 0
var randnum2 = 0

func _ballvel() -> void:

	randnum1 = randi()% 2
	randnum2 = randi()% 100
	if randnum1 == 1:
		multiplier = 1
	else:
		multiplier = -1
	$Chaos_Ball1.linear_velocity = Vector3(randnum2 * multiplier, 0, randnum2 * ~multiplier)
	
	randnum1 = randi()% 2
	randnum2 = randi()% 100
	if randnum1 == 1:
		multiplier = 1
	else:
		multiplier = -1
	$Chaos_Ball2.linear_velocity = Vector3(randnum2 * multiplier, 0, randnum2 * ~multiplier)
	
	randnum1 = randi()% 2
	randnum2 = randi()% 100
	if randnum1 == 1:
		multiplier = 1
	else:
		multiplier = -1
	$Chaos_Ball3.linear_velocity = Vector3(randnum2 * multiplier, 0, randnum2 * ~multiplier)
	
	randnum1 = randi()% 2
	randnum2 = randi()% 100
	if randnum1 == 1:
		multiplier = 1
	else:
		multiplier = -1
	$Chaos_Ball4.linear_velocity = Vector3(randnum2 * multiplier, 0, randnum2 * ~multiplier)
	
	
func _ready():
	
	$Chaos_Ball1.linear_velocity = Vector3(20, 0, 0)
	$Chaos_Ball2.linear_velocity = Vector3(-20, 0, 0)
	$Chaos_Ball3.linear_velocity = Vector3(0, 0, 20)
	$Chaos_Ball4.linear_velocity = Vector3(0, 0, -20)
	
func _process(_delta):
	
	if $ContactTimer.time_left <= 0.05:
		$ContactTimer.stop()
		print($ContactTimer.time_left, " ", randnum1, randnum2)
		print($Chaos_Ball1.linear_velocity)
		print($Chaos_Ball2.linear_velocity)
		print($Chaos_Ball3.linear_velocity)
		print($Chaos_Ball4.linear_velocity)
		_ballvel()
		$ContactTimer.start()
