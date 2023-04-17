extends Control



func _ready():
	$Label2.text = str(PlayPresets.time) + "s"


func _on_playagain_pressed():
	get_tree().change_scene_to_file("res://title_screen.tscn")
