extends Node

var selected_employee: Employee = null
var main_cam: AdvancedCamera = null
var selected_company: Texture2D = null
var intended_answer = []
var player_answer = []

func _ready() -> void:
	if not Events.employee_vote_toggled.is_connected(_on_employee_vote_toggled):
		Events.employee_vote_toggled.connect(_on_employee_vote_toggled)
func set_main_cam(cam: AdvancedCamera):
	main_cam = cam


func _process(delta: float) -> void:
	if not intended_answer:
		for key in Situation.situation[Situation.selected_situation]:
			var entry = Situation.situation[1][key]
			if entry is Dictionary and entry.get("is_corrupted", false):
				intended_answer.append(key)
	selected_company = Situation.situation[Situation.selected_situation]["company"]
	if selected_employee and main_cam:
		main_cam.zoom_to(selected_employee)
	else:
		main_cam.zoom_out()

func _on_employee_vote_toggled(id: String, pressed: bool) -> void:
	if pressed:
		if not player_answer.has(id):
			player_answer.append(id)
			player_answer.sort()
	else:
		player_answer.erase(id)
