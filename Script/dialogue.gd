extends CanvasLayer
@onready var container: MarginContainer = $TextBoxContainer
@onready var text: Label = $TextBoxContainer/MarginContainer/HBoxContainer/Label
@onready var trans_buttons: Array[Button] = [
	$trans1, $trans2, $trans3, $trans4, $trans5, $trans6
]
@onready var exit_button: TextureButton = $exit_button
@onready var transcript_sprite: Sprite2D = $transcript_sprite
@onready var company_button: TextureButton = $MarginContainer/company_button
@onready var company_transcript: Sprite2D = $company_transcript

var pulled: bool = false


var character_sound: AudioStream


func _ready() -> void:
	hide_textbox()
	for i in trans_buttons.size():
		trans_buttons[i].pressed.connect(func(): _on_transcript_pressed(i))

func _process(delta: float) -> void:
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
	
func hide_textbox():
	text.text = ""
	container.hide()
	
func show_textbox():
	container.show()

func add_text(next_text: String, sound: AudioStream = null):
	text.visible_ratio = 0.0
	text.text = next_text
	container.show()
	
	var chars := next_text.length()
	var time_per_char := 0.04
	var duration := chars * time_per_char

	# tween for the typing effect
	var tween := get_tree().create_tween()
	tween.tween_property(text, "visible_ratio", 1.0, duration) \
		.set_trans(Tween.TRANS_LINEAR) \
		.set_ease(Tween.EASE_IN_OUT)

	# play sound while text is appearing
	if sound:
		_play_character_sounds(chars, time_per_char, sound)

func _play_character_sounds(chars: int, delay: float, sound: AudioStream) -> void:
	var audio := AudioStreamPlayer.new()
	add_child(audio)
	audio.stream = sound

	for i in range(chars):
		audio.play()
		await get_tree().create_timer(delay).timeout

func _on_transcript_pressed(index: int) -> void:
	if GameManager.selected_employee == null:
		return
	var lines = GameManager.selected_employee.transcript
	if index < 0 or index >= lines.size():
		return
	add_text(lines[index])
	
func pull_up(script: Texture2D = null):
	if GameManager.selected_employee:
		transcript_sprite.position.y = lerp(transcript_sprite.position.y, 0.0, get_process_delta_time() * 12)
		transcript_sprite.texture = script

func pull_down():
	transcript_sprite.position.y = lerp(transcript_sprite.position.y, 720.0, get_process_delta_time() * 12)

func _on_exit_button_pressed() -> void:
		print("selected reset")
		hide_textbox()
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
