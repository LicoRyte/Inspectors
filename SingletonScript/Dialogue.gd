extends CanvasLayer

@onready var container: MarginContainer = $dialogue/TextBoxContainer
@onready var text: Label = $dialogue/TextBoxContainer/MarginContainer/HBoxContainer/Label
var active_tween: Tween

var locked = false

func _ready() -> void:
	hide_textbox()

func hide_textbox():
	text.text = ""
	container.hide()
	
func show_textbox():
	if not locked:
		container.show()

func add_text(next_text: String, sound: AudioStream = null):
	# If a tween is already running, kill it
	if active_tween and active_tween.is_running():
		active_tween.kill()

	# Reset
	text.visible_ratio = 0.0
	text.text = next_text
	container.show()
	
	# Timing
	var chars := next_text.length()
	var time_per_char := 0.02
	var duration := chars * time_per_char
	var time_delay := 0.05

	# New tween
	active_tween = get_tree().create_tween()
	active_tween.tween_property(text, "visible_ratio", 1.0, duration) \
		.set_trans(Tween.TRANS_LINEAR) \
		.set_ease(Tween.EASE_IN_OUT)


	# play sound while text is appearing
	if GlobalAudio.sound_effect["type2"]:
		_play_character_sounds(time_delay, GlobalAudio.sound_effect["type2"])

func _play_character_sounds(delay: float, sound: AudioStream) -> void:

	while text.visible_ratio < 1.0:
		var audio := AudioStreamPlayer.new()
		add_child(audio)
		audio.stream = sound
		audio.play()
		await get_tree().create_timer(delay).timeout
