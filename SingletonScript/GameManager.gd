extends Node

var selected_employee: Employee = null

func _process(delta: float) -> void:
	if selected_employee and Input.is_action_just_pressed("devtestbutton"):
		print("selected reset")
		selected_employee = null
