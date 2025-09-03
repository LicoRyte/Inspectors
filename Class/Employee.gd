extends Interactable
class_name Employee

enum employee_ID {
	one,
	two,
	three,
}

@export var employee_number = employee_ID.one

@export var is_corrupted: bool = false
@export var is_voted: bool = false

@export var message: String= ""
@export var transcript_sprite: Sprite2D = null


#Interactable Class Function

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if not GameManager.selected_employee:
		if event is InputEventMouseButton and event.pressed:
			GameManager.selected_employee = self
			print("Employee Name: " + name)


func _on_mouse_entered() -> void:
	super()

func _on_mouse_exited() -> void:
	super()
