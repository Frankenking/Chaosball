extends Node3D


var rng = RandomNumberGenerator.new()
var randnum1 = 0
var randnum2 = 0
var vector = Vector3()

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
	
	randnum1 = rng.randf_range(-50.0, 50.0)
	randnum2 = rng.randf_range(-50.0, 50.0)
	$Balls/Chaos_Ball1.linear_velocity = Vector3(randnum1, 0, randnum2)
	
	randnum1 = rng.randf_range(-50.0, 50.0)
	randnum2 = rng.randf_range(-50.0, 50.0)
	$Balls/Chaos_Ball2.linear_velocity = Vector3(randnum1, 0, randnum2)
	
	randnum1 = rng.randf_range(-50.0, 50.0)
	randnum2 = rng.randf_range(-50.0, 50.0)
	$Balls/Chaos_Ball3.linear_velocity = Vector3(randnum1, 0, randnum2)
	
	randnum1 = rng.randf_range(-50.0, 50.0)
	randnum2 = rng.randf_range(-50.0, 50.0)
	$Balls/Chaos_Ball4.linear_velocity = Vector3(randnum1, 0, randnum2)
		
func _ready():
	
	$Balls/Chaos_Ball1.linear_velocity = Vector3(10, 0, 0)
	$Balls/Chaos_Ball2.linear_velocity = Vector3(-10, 0, 0)
	$Balls/Chaos_Ball3.linear_velocity = Vector3(0, 0, 10)
	$Balls/Chaos_Ball4.linear_velocity = Vector3(0, 0, -10)
	
func _process(_delta):
	_ballposcheck()
	if $ContactTimer.time_left <= 0.05:
		$ContactTimer.stop()
		_ballvel()
		$ContactTimer.start()

func _on_red_rg_body_entered(body):
	if body == $GoalBalls/RedBall:
		$GoalBalls/RedBall.hide()
		$GoalBalls/GreenBall.translate(Vector3(-50,0,0))
		$GoalBalls/GreenBall.show()
		$GoalBalls/GreenBall.freeze = false

func _on_green_rg_body_entered(body):
	if body == $GoalBalls/GreenBall:
		$GoalBalls/GreenBall.hide()
		$GoalBalls/BlueBall.translate(Vector3(-50,0,0))
		$GoalBalls/BlueBall.show()
		$GoalBalls/BlueBall.freeze = false

func _on_blue_rg_body_entered(body):
	if body == $GoalBalls/BlueBall:
		$GoalBalls/BlueBall.hide()
		$GoalBalls/YellowBall.translate(Vector3(-50,0,0))
		$GoalBalls/YellowBall.show()
		$GoalBalls/YellowBall.freeze = false

		


func _on_yellow_rg_body_entered(body):
	if body == $GoalBalls/YellowBall:
		$GoalBalls/YellowBall.hide()
