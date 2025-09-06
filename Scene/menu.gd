extends Control


func _on_texture_play_pressed() -> void:
	Situation.random_situation()
	Scene.Change("main")
	GlobalAudio.change_music("darkatmos")
	GlobalTimer.add_time(100)
	
func _on_texture_exit_pressed() -> void:
	get_tree().quit()

func _ready () -> void:
	GlobalAudio.change_music("menu")
	$CanvasLayer/AnimationPlayer.play("Fade out")
	await(get_tree().create_timer(3).timeout)
