extends Control

func _ready():
	pass
func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_settings_button_pressed():
	$Settings.show()
	$Main.hide()
	
func _on_back_pressed():
	$Main.show()
	$Settings.hide()
