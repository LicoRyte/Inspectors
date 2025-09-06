extends Node2D

var current_music: AudioStream
var fade_time = 0.2
@onready var bg_player: AudioStreamPlayer = $AudioStreamPlayer

var music = {
	"darkatmos" :preload("res://Assets/Music/sfx/Dark _Atmosphere13_Looped_24bit.wav"),
	"menu" : preload("res://Assets/Music/The Oldest Mage.ogg")
}

var sound_effect = {
	"reliable": preload("res://Assets/Music/sfx/reliable.mp3"),
	"riser": preload("res://Assets/Music/sfx/riser.mp3"),
	"paper": preload("res://Assets/Music/sfx/paperflutter.ogg"),
	"shift_end": preload("res://Assets/Music/sfx/shift_end.ogg"),
	"type": preload("res://Assets/Music/sfx/typewriter.ogg")
}



func change_music(new_music: String):
	if current_music != music[new_music]:
		current_music = music[new_music]
		var tween = create_tween()
		# Fade out current music
		tween.tween_property(bg_player, "volume_db", -80, fade_time)
		tween.tween_callback(func():
			# Set new music and reset volume
			bg_player.stream = music[new_music]
			bg_player.volume_db = -15
			bg_player.play()
		)

func effect(sfx: String):
	var audio = AudioStreamPlayer.new()
	add_child(audio)
	audio.stream = sound_effect[sfx]
	audio.play()
	await audio.finished
	remove_child(audio)
