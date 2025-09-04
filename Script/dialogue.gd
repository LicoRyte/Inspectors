extends CanvasLayer
@onready var container: MarginContainer = $TextBoxContainer
@onready var text: Label = $TextBoxContainer/MarginContainer/HBoxContainer/Label
@onready var trans_buttons: Array[Button] = [
	$trans1, $trans2, $trans3, $trans4, $trans5, $trans6
]
@onready var exit_button: TextureButton = $exit_button
@onready var transcript_sprite: Sprite2D = $transcript_sprite
var character_sound: AudioStream


func _ready() -> void:
	hide_textbox()
	for i in trans_buttons.size():
		trans_buttons[i].pressed.connect(func(): _on_transcript_pressed(i))

func _process(delta: float) -> void:
	pull_up(GameManager.selected_employee.transcript_sprite) if GameManager.selected_employee else pull_down()
	if not GameManager.selected_employee:
		exit_button.hide()
		for i in trans_buttons.size():
			trans_buttons[i].hide()
	else:
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
		transcript_sprite.position.y = lerp(transcript_sprite.position.y, 0.0, get_process_delta_time() * 10)
		transcript_sprite.texture = script

func pull_down():
	transcript_sprite.position.y = lerp(transcript_sprite.position.y, 720.0, get_process_delta_time() * 10)

func _on_exit_button_pressed() -> void:
		print("selected reset")
		hide_textbox()
		GameManager.selected_employee = null
