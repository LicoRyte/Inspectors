extends Node



@onready var scene_animation: AnimationPlayer = $SceneAnimation
var scene = {
	"main": preload("res://Scene/main.tscn"),
	"menu" : preload("res://Scene/menu.tscn"),
	"shift_end" : preload("res://Scene/shift_ended.tscn"),
	"summary": preload("res://Scene/summary.tscn"),
}
func Change(scene_name):
	if not scene.has(scene_name):
		print(scene_name, " not cached yet")
	else:
		scene_animation.play("Transition")
		await scene_animation.animation_finished
		get_tree().change_scene_to_packed(scene[scene_name])
		Events.emit_signal("_transitioned")
		print("scene change!")
		scene_animation.play_backwards("Transition")
		await scene_animation.animation_finished

func Shift(scene_name):
	if not scene.has(scene_name):
		print(scene_name, " not cached yet")
	else:
		scene_animation.play("Transition")
		await scene_animation.animation_finished
		get_tree().change_scene_to_packed(scene[scene_name])
		Events.emit_signal("_transitioned")
		scene_animation.play_backwards("Quick Transition")
		await scene_animation.animation_finished
