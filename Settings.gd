extends Control

func _process(delta):
	pass




func _on_chaos_ball_color_wheel_color_changed(color):
	PlayPresets.ball_albedo = $ChaosBall/ChaosBallColorWheel.color
	$"3dDisplays/ballPrev".material.albedo_color = PlayPresets.ball_albedo

func _on_metallic_2_value_changed(value):
	PlayPresets.ball_metallic = $ChaosBall/Metallic2.value
	$"3dDisplays/ballPrev".material.metallic = PlayPresets.ball_metallic

func _on_rough_2_value_changed(value):
	PlayPresets.ball_rough = $ChaosBall/Rough2.value
	$"3dDisplays/ballPrev".material.roughness = PlayPresets.ball_rough
	
func _on_player_ball_color_wheel_color_changed(color):
	PlayPresets.player_albedo = $Player/PlayerBallColorWheel.color
	$"3dDisplays/playerPrev".material.albedo_color = PlayPresets.player_albedo


func _on_metallic_value_changed(value):
	PlayPresets.player_metallic = $Player/Metallic.value
	$"3dDisplays/playerPrev".material.metallic = PlayPresets.player_metallic


func _on_rough_value_changed(value):
	PlayPresets.player_rough = $Player/Rough.value
	$"3dDisplays/playerPrev".material.roughness = PlayPresets.player_rough

