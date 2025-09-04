extends Interactable
class_name Employee


enum employee_ID {
	one,
	two,
	three,
}
@onready var flag_button: TextureButton = $flag

@export var flag: TextureButton
@export var employee_number = employee_ID.one
@export var intro_message: String = ""
@export var transcript = []
@export var is_corrupted: bool = false
@export var transcript_sprite: CompressedTexture2D

@export var is_voted: bool = false

var ID: String

func _ready() -> void:
	super()
	flag.toggled.connect(_on_flag_toggled)
	match employee_number:
		employee_ID.one:
			ID = "ID1"
		employee_ID.two:
			ID = "ID2"
		employee_ID.three:
			ID = "ID3"
func _process(delta: float) -> void:
	if not GameManager.selected_employee or GameManager.selected_employee == flag.get_parent():
		flag.disabled = false
	else:
		flag.disabled = true

	var data = Situation.situation[Situation.selected_situation][ID]
	intro_message = data["Intro"]
	transcript = data["transcripts"]
	is_corrupted = data["is_corrupted"]
	transcript_sprite = data["transcript_sprite"]
	

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if not GameManager.selected_employee:
		if event is InputEventMouseButton and event.pressed:
			GameManager.selected_employee = self
			Dialogue.add_text(intro_message)

func _on_mouse_entered() -> void:
	super()

func _on_mouse_exited() -> void:
	super()

func _on_flag_toggled(pressed: bool) -> void:
	Events.emit_signal("employee_vote_toggled",ID, pressed)
