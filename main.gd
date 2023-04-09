extends Node3D


var rng = RandomNumberGenerator.new()
var randnum1 = 0
var randnum2 = 0
var vector = Vector3()

@onready var Redball := $GoalBalls/RedBall
@onready var Yellowball := $GoalBalls/YellowBall
@onready var Blueball := $GoalBalls/BlueBall
@onready var Greenball := $GoalBalls/GreenBall

@onready var Ball1 := $Balls/Chaos_Ball1
@onready var Ball2 := $Balls/Chaos_Ball2
@onready var Ball3 := $Balls/Chaos_Ball3
@onready var Ball4 := $Balls/Chaos_Ball4

var points = 0

func _ballposcheck() -> void:
	
				
	for index in Ball1.position:
			if abs(index) > 25:
				Ball1.position = Vector3(0, 1, 0)
				
	for index in Ball2.position:
			if abs(index) > 25:
				Ball2.position = Vector3(0, 1, 0)
				
	for index in Ball3.position:
			if abs(index) > 25:
				Ball3.position = Vector3(0, 1, 0)
				
	for index in Ball4.position:
			if abs(index) > 25:
				Ball4.position = Vector3(0, 1, 0)
				
func _ballvel() -> void:
	
	randnum1 = rng.randf_range(-50.0, 50.0)
	randnum2 = rng.randf_range(-50.0, 50.0)
	Ball1.linear_velocity = Vector3(randnum1, 0, randnum2)
	
	randnum1 = rng.randf_range(-50.0, 50.0)
	randnum2 = rng.randf_range(-50.0, 50.0)
	Ball2.linear_velocity = Vector3(randnum1, 0, randnum2)
	
	randnum1 = rng.randf_range(-50.0, 50.0)
	randnum2 = rng.randf_range(-50.0, 50.0)
	Ball3.linear_velocity = Vector3(randnum1, 0, randnum2)
	
	randnum1 = rng.randf_range(-50.0, 50.0)
	randnum2 = rng.randf_range(-50.0, 50.0)
	Ball4.linear_velocity = Vector3(randnum1, 0, randnum2)
		
func _ready():
	
	Ball1.linear_velocity = Vector3(10, 0, 0)
	Ball2.linear_velocity = Vector3(-10, 0, 0)
	Ball3.linear_velocity = Vector3(0, 0, 10)
	Ball4.linear_velocity = Vector3(0, 0, -10)



func _process(_delta):
	_ballposcheck()
	if $ContactTimer.time_left <= 0.05:
		$ContactTimer.stop()
		_ballvel()
		$ContactTimer.start()
	if points == 4:
		pass

func _on_red_rg_body_entered(body):
	if body == Redball:
		Redball.queue_free()
		points += 1
		
func _on_yellow_rg_body_entered(body):
	if body == Yellowball:
		Yellowball.queue_free()
		points += 1

func _on_green_rg_body_entered(body):
	if body == Greenball:
		Greenball.queue_free()
		points += 1
		
func _on_blue_rg_body_entered(body):
	if body == Blueball:
		Blueball.queue_free()
		points += 1
		
