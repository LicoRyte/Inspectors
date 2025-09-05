extends CanvasLayer

@onready var container: MarginContainer = $dialogue/TextBoxContainer
@onready var text: Label = $dialogue/TextBoxContainer/MarginContainer/HBoxContainer/Label

func _ready() -> void:
	hide_textbox()

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
