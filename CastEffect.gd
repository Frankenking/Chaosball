extends Node3D

var obj = null
var collided = false

func isfast():
		if abs($"..".linear_velocity[0]) >= 8.0:
			return true
		elif abs($"..".linear_velocity[2]) >= 8.0:
			return true
			
func _ready():
	$"../roll2".volume_db = $"../roll2".volume_db
func _collide_fx():
	if isfast() and collided:
		$GPUParticles3D.emitting = true
		$"../roll2".playing = true
	else:
		$GPUParticles3D.emitting = false

func _process(delta):
	_collide_fx()
	$".".rotate_y(1)

func _on_area_1_body_entered(body):
	if body != $"..":
		obj = body
		collided = true
		


func _on_area_1_body_exited(body):
	if body != $"..":
		obj = null
		collided = false
		$"../roll2".playing = false
	


