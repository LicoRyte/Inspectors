extends Control


func _on_texture_play_pressed() -> void:
	Situation.random_situation()
	Scene.Change("main")
	GlobalTimer.add_time(90)
	
func _on_texture_exit_pressed() -> void:
	get_tree().quit()

func _ready () -> void:
	pass
