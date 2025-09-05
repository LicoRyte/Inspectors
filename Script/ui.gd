extends CanvasLayer
@onready var container: MarginContainer = $dialogue/TextBoxContainer
@onready var text: Label = $dialogue/TextBoxContainer/MarginContainer/HBoxContainer/Label
@onready var trans_buttons: Array[Button] = [
	$transcript_menu_subpanel/trans1, $transcript_menu_subpanel/trans2, $transcript_menu_subpanel/trans3, $transcript_menu_subpanel/trans4, $transcript_menu_subpanel/trans5, $transcript_menu_subpanel/trans6
]
@onready var exit_button: TextureButton = $exit_button
@onready var transcript_sprite: Sprite2D = $hand_ui/transcript_sprite
@onready var company_button: TextureButton = $company_button_subpanel/MarginContainer/company_button
@onready var company_transcript: Sprite2D = $hand_ui/company_transcript



var pulled: bool = false
var visibility_lock: bool = false


var character_sound: AudioStream


func _ready() -> void:
	for i in trans_buttons.size():
		trans_buttons[i].pressed.connect(func(): _on_transcript_pressed(i))

func hide_ui():
	visibility_lock = true
	for i in self.get_children():
		if i == $Post_processing:
			continue
		i.hide()

func show_ui():
	visibility_lock = false
	for i in self.get_children():
		i.show()

func _process(delta: float) -> void:
	if visibility_lock:
		return
	if pulled:
		pull_company_up()
	else:
		pull_company_down()
	pull_up(GameManager.selected_employee.transcript_sprite) if GameManager.selected_employee else pull_down()
	if not GameManager.selected_employee:
		company_button.show()
		exit_button.hide()
		for i in trans_buttons.size():
			trans_buttons[i].hide()
	else:
		company_button.hide()
		exit_button.show()
		for i in trans_buttons.size():
			trans_buttons[i].show()
	

func _on_transcript_pressed(index: int) -> void:
	if visibility_lock:
		return
	if GameManager.selected_employee == null:
		return
	var lines = GameManager.selected_employee.transcript
	if index < 0 or index >= lines.size():
		return
	Dialogue.add_text(lines[index])
	
func pull_up(script: Texture2D = null):
	if GameManager.selected_employee:
		transcript_sprite.position.y = lerp(transcript_sprite.position.y, 0.0, get_process_delta_time() * 12)
		transcript_sprite.texture = script

func pull_down():
	transcript_sprite.position.y = lerp(transcript_sprite.position.y, 720.0, get_process_delta_time() * 12)

func _on_exit_button_pressed() -> void:
		print("selected reset")
		Dialogue.hide_textbox()
		GameManager.selected_employee = null

func pull_company_up():
	company_transcript.texture = GameManager.selected_company
	company_transcript.global_position.y = move_toward(company_transcript.global_position.y, 0.0, get_process_delta_time() * 3000)

func pull_company_down():
	company_transcript.global_position.y = move_toward(company_transcript.global_position.y, 720.0, get_process_delta_time() * 3000)
func _on_company_button_mouse_entered() -> void:
	pulled = true
func _on_company_button_mouse_exited() -> void:
	pulled = false
