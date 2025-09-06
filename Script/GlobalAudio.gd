extends Node2D

var current_music: AudioStream
var fade_time = 0.2
@onready var bg_player: AudioStreamPlayer = $AudioStreamPlayer

var music = {
	"darkatmos" : preload("res://Assets/Music/Dark _Atmosphere13_Looped_24bit.wav"),
	"menu" : preload("res://Assets/Music/The Oldest Mage.ogg")
}

var sound_effect = {

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
	audio.play(music[sfx])
	await audio.finished
	remove_child(audio)
