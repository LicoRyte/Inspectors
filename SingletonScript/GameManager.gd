extends Node

var selected_employee: Employee = null
var main_cam: AdvancedCamera = null
var selected_company: Texture2D = null
var intended_answer = []
var player_answer = []

func _ready() -> void:
	Events._on_shift_ended.connect(_on_shift_ended)
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
	if main_cam:
		if selected_employee:
			main_cam.zoom_to(selected_employee)
		else:
			main_cam.zoom_out()
	if intended_answer == player_answer:
		print("ok")

func _on_employee_vote_toggled(id: String, pressed: bool) -> void:
	if pressed:
		if not player_answer.has(id):
			player_answer.append(id)
			player_answer.sort()
	else:
		player_answer.erase(id)

func _on_shift_ended():
	Dialogue.hide_textbox()
	Scene.Shift("shift_end")
	await Events._transitioned
	await get_tree().create_timer(5.0).timeout
	
	Scene.Change("summary")
	
