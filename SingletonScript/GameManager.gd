extends Node

var selected_employee: Employee = null
var main_cam: AdvancedCamera = null
var intended_answer = []


func set_main_cam(cam: AdvancedCamera):
	main_cam = cam


func _process(delta: float) -> void:
	if selected_employee and main_cam:
		main_cam.zoom_to(selected_employee)
	else:
		main_cam.zoom_out()
