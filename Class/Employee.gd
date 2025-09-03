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

var ID: String

func _ready() -> void:
	match employee_number:
		employee_ID.one:
			ID = "ID1"
		employee_ID.two:
			ID = "ID2"
		employee_ID.three:
			ID = "ID3"

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if not GameManager.selected_employee:
		if event is InputEventMouseButton and event.pressed:
			GameManager.selected_employee = self
			print(Situation.situation[Situation.selected_situation][ID]["name"])


func _on_mouse_entered() -> void:
	super()

func _on_mouse_exited() -> void:
	super()
