extends Node3D

var rng = RandomNumberGenerator.new()
var rng2 = RandomNumberGenerator.new()

var multiplier = 0

var randnum1 = 0
var randnum2 = 0

func _ballposcheck() -> void:
	
	for index in $GoalBalls/RedBall.position:
			if abs(index) > 25:
				$GoalBalls/RedBall.position = Vector3(0, 1, 0)
				
	for index in $Balls/Chaos_Ball1.position:
			if abs(index) > 25:
				$Balls/Chaos_Ball1.position = Vector3(0, 1, 0)
				
	for index in $Balls/Chaos_Ball2.position:
			if abs(index) > 25:
				$Balls/Chaos_Ball2.position = Vector3(0, 1, 0)
				
	for index in $Balls/Chaos_Ball3.position:
			if abs(index) > 25:
				$Balls/Chaos_Ball3.position = Vector3(0, 1, 0)
				
	for index in $Balls/Chaos_Ball4.position:
			if abs(index) > 25:
				$Balls/Chaos_Ball4.position = Vector3(0, 1, 0)
				
func _ballvel() -> void:

	randnum1 = randi()% 2
	randnum2 = randi()% 100
	if randnum1 == 1:
		multiplier = 1
	else:
		multiplier = -1
	$Balls/Chaos_Ball1.linear_velocity = Vector3(randnum2 * multiplier, 0, randnum2 * ~multiplier)
	
	randnum1 = randi()% 2
	randnum2 = randi()% 100
	if randnum1 == 1:
		multiplier = 1
	else:
		multiplier = -1
	$Balls/Chaos_Ball2.linear_velocity = Vector3(randnum2 * multiplier, 0, randnum2 * ~multiplier)
	
	randnum1 = randi()% 2
	randnum2 = randi()% 100
	if randnum1 == 1:
		multiplier = 1
	else:
		multiplier = -1
	$Balls/Chaos_Ball3.linear_velocity = Vector3(randnum2 * multiplier, 0, randnum2 * ~multiplier)
	
	randnum1 = randi()% 2
	randnum2 = randi()% 100
	if randnum1 == 1:
		multiplier = 1
	else:
		multiplier = -1
	$Balls/Chaos_Ball4.linear_velocity = Vector3(randnum2 * multiplier, 0, randnum2 * ~multiplier)
	
	
func _ready():
	
	$Balls/Chaos_Ball1.linear_velocity = Vector3(20, 0, 0)
	$Balls/Chaos_Ball2.linear_velocity = Vector3(-20, 0, 0)
	$Balls/Chaos_Ball3.linear_velocity = Vector3(0, 0, 20)
	$Balls/Chaos_Ball4.linear_velocity = Vector3(0, 0, -20)
	
func _process(_delta):
	_ballposcheck()
	
	if $ContactTimer.time_left <= 0.05:
		$ContactTimer.stop()
		_ballvel()
		$ContactTimer.start()
