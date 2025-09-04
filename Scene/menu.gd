extends Control

func _on_texture_play_pressed() -> void:
	Situation.random_situation()
	get_tree().change_scene_to_file("res://Scene/main.tscn")
	
func _on_texture_exit_pressed() -> void:
	get_tree().quit()

func _ready () -> void:
	Dialogue.company_button.hide()
