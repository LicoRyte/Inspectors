extends Node

var scene = {
	"Test1": preload("res://Scene/2dscene.tscn"),
	"Test2": preload("res://Scene/Derivertive.tscn")
}

func Change(scene_name):
	if not scene.has(scene_name):
		print(scene_name, " not cached yet")
	else:
		get_tree().change_scene_to_packed(scene[scene_name])
