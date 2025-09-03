extends Interactable
class_name Employee

enum employee_ID {
	one,
	two,
	three,
}

@export var employee_number = employee_ID.one
@export var intro_message: String = ""
@export var transcript = []
@export var is_corrupted: bool = false
@export var transcript_sprite: Sprite2D

var ID: String

func _ready() -> void:
	super()
	match employee_number:
		employee_ID.one:
			ID = "ID1"
		employee_ID.two:
			ID = "ID2"
		employee_ID.three:
			ID = "ID3"
func _process(delta: float) -> void:
	var data = Situation.situation[Situation.selected_situation][ID]
	intro_message = data["Intro"]
	transcript = data["transcripts"]
	is_corrupted = data["is_corrupted"]
	transcript_sprite = data["transcript_sprite"]



func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if not GameManager.selected_employee:
		if event is InputEventMouseButton and event.pressed:
			GameManager.selected_employee = self
			_show_dialog(intro_message)

func _on_mouse_entered() -> void:
	super()

func _on_mouse_exited() -> void:
	super()

func _show_dialog(message) -> void:
	if Dialogic.current_timeline != null:
		return

	# 1) Make a timeline in code
	var timeline := DialogicTimeline.new()
	

	var events: Array = []
	events.append(message)

	timeline.events = events
	Dialogic.start(timeline)
