extends Node



#Does play but not finished
@onready var scene_animation: AnimationPlayer = $SceneAnimation

var scene = {
	"Test1": preload("res://Scene/2dscene.tscn"),
	"Test2": preload("res://Scene/Derivertive.tscn")
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
