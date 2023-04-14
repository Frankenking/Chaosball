extends Node3D


var rng = RandomNumberGenerator.new()
var randnum1 = 0
var randnum2 = 0
var randnum3 = 0
var vector = Vector3()
var freeze = false
var time = 0
@export var BALL_LINEAR = 30

@onready var Redball := $GoalBalls/RedBall
@onready var Yellowball := $GoalBalls/YellowBall
@onready var Blueball := $GoalBalls/BlueBall
@onready var Greenball := $GoalBalls/GreenBall

@onready var Ball1 := $Balls/Chaos_Ball1
@onready var Ball2 := $Balls/Chaos_Ball2
@onready var Ball3 := $Balls/Chaos_Ball3
@onready var Ball4 := $Balls/Chaos_Ball4

var ballRed = true
var ballYellow = true
var ballBlue = true
var ballGreen = true

var points = 0

func _ballposcheck() -> void:
	
	
	if abs($Character.position[0]) > 25:
		$Character.position = Vector3(0, 1, 0)
	elif abs($Character.position[2]) > 25:
		$Character.position = Vector3(0, 1, 0)
		
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

func _goalposcheck():
	if ballRed == true:
		for index in Redball.position:
			if abs(index) > 25:
				$GoalBalls/RedBall.position = Vector3(0, 1, 0)
	
	if ballYellow == true:
		for index in Yellowball.position:
			if abs(index) > 25:
				$GoalBalls/YellowBall.position = Vector3(0, 1, 0)
	
	if ballBlue == true:
		for index in Blueball.position:
			if abs(index) > 25:
				$GoalBalls/BlueBall.position = Vector3(0, 1, 0)
	
	if ballGreen == true:
		for index in Greenball.position:
			if abs(index) > 25:
				$GoalBalls/GreenBall.position = Vector3(0, 1, 0)
	
func _ballvel() -> void:
	
	randnum1 = rng.randf_range(-BALL_LINEAR, BALL_LINEAR)
	randnum2 = rng.randf_range(-BALL_LINEAR, BALL_LINEAR)
	Ball1.linear_velocity = Vector3(randnum1, 0, randnum2)
	
	randnum1 = rng.randf_range(-BALL_LINEAR, BALL_LINEAR)
	randnum2 = rng.randf_range(-BALL_LINEAR, BALL_LINEAR)
	Ball2.linear_velocity = Vector3(randnum1, 0, randnum2)
	
	randnum1 = rng.randf_range(-BALL_LINEAR, BALL_LINEAR)
	randnum2 = rng.randf_range(-BALL_LINEAR, BALL_LINEAR)
	Ball3.linear_velocity = Vector3(randnum1, 0, randnum2)
	
	randnum1 = rng.randf_range(-BALL_LINEAR, BALL_LINEAR)
	randnum2 = rng.randf_range(-BALL_LINEAR, BALL_LINEAR)
	Ball4.linear_velocity = Vector3(randnum1, 0, randnum2)
	
func _ready():
	
	Ball1.linear_velocity = Vector3(10, 0, 0)
	Ball2.linear_velocity = Vector3(-10, 0, 0)
	Ball3.linear_velocity = Vector3(0, 0, 10)
	Ball4.linear_velocity = Vector3(0, 0, -10)
	
	$Balls/Chaos_Ball1/CSGSphere3D.material.albedo_color = PlayPresets.ball_albedo
	$Balls/Chaos_Ball1/CSGSphere3D.material.metallic = PlayPresets.ball_metallic
	$Balls/Chaos_Ball1/CSGSphere3D.material.roughness = PlayPresets.ball_rough
	
	$Balls/Chaos_Ball2/CSGSphere3D.material.albedo_color = PlayPresets.ball_albedo
	$Balls/Chaos_Ball2/CSGSphere3D.material.metallic = PlayPresets.ball_metallic
	$Balls/Chaos_Ball2/CSGSphere3D.material.roughness = PlayPresets.ball_rough
	
	$Balls/Chaos_Ball3/CSGSphere3D.material.albedo_color = PlayPresets.ball_albedo
	$Balls/Chaos_Ball3/CSGSphere3D.material.metallic = PlayPresets.ball_metallic
	$Balls/Chaos_Ball3/CSGSphere3D.material.roughness = PlayPresets.ball_rough
	
	$Balls/Chaos_Ball4/CSGSphere3D.material.albedo_color = PlayPresets.ball_albedo
	$Balls/Chaos_Ball4/CSGSphere3D.material.metallic = PlayPresets.ball_metallic
	$Balls/Chaos_Ball4/CSGSphere3D.material.roughness = PlayPresets.ball_rough
	
	$Character/CollisionShape3D/MeshInstance3D.material.albedo_color = PlayPresets.player_albedo
	$Character/CollisionShape3D/MeshInstance3D.material.metallic = PlayPresets.player_metallic
	$Character/CollisionShape3D/MeshInstance3D.material.roughness = PlayPresets.player_rough
	
func _process(_delta):
	_ballposcheck()
	_goalposcheck()
	if $Stopwatch.time_left == 0:
		$Stopwatch.start()
		time += 1
		print(time)
	if $ContactTimer.time_left <= 0.05:
		$ContactTimer.stop()
		if freeze == false:
			_ballvel()
		else:
			Ball1.linear_velocity = Vector3(0, 0, 0)
			Ball2.linear_velocity = Vector3(0, 0, 0)
			Ball3.linear_velocity = Vector3(0, 0, 0)
			Ball4.linear_velocity = Vector3(0, 0, 0)
			
		$ContactTimer.start()
	if points == 4:
		PlayPresets.time = time
		get_tree().change_scene_to_file("res://win_screen.tscn")
	if $Arena/Freeze/Timer.time_left == 0:
		freeze = false

func _on_red_rg_body_entered(body):
	if body == Redball:
		Redball.queue_free()
		points += 1
		ballRed = false
	
func _on_yellow_rg_body_entered(body):
	if body == Yellowball:
		Yellowball.queue_free()
		points += 1
		ballYellow = false
	
func _on_green_rg_body_entered(body):
	if body == Greenball:
		Greenball.queue_free()
		points += 1
		ballGreen = false
	
func _on_blue_rg_body_entered(body):
	if body == Blueball:
		Blueball.queue_free()
		points += 1
		ballBlue = false


func _on_freeze_body_entered(body):
	if body == $Character:
		freeze = true
		$Arena/Freeze/Timer.start()
		
