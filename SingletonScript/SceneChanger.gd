extends Node



@onready var scene_animation: AnimationPlayer = $SceneAnimation
var scene = {
	"main": preload("res://Scene/main.tscn"),
	"hand" : preload("res://Scene/hand_ui.tscn")
}
func Change(scene_name):
	if not scene.has(scene_name):
		print(scene_name, " not cached yet")
	else:
		scene_animation.play("Transition")
		await scene_animation.animation_finished
		get_tree().change_scene_to_packed(scene[scene_name])
		print("scene change!")
		scene_animation.play_backwards("Transition")
		await scene_animation.animation_finished
