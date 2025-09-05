extends Node2D
@onready var text: Label = $Sprite2D/MarginContainer/Panel/HBoxContainer/Label

func _ready() -> void:
	# Connect the GlobalTimer’s timeout signal so it updates every tick
	GlobalTimer.timer.timeout.connect(_on_timer_tick)

	_update_label()

func _on_timer_tick():
	_update_label()

func _update_label():
	var seconds_left = GlobalTimer.clock_time
	var minutes = int(seconds_left / 60)
	var seconds = int(seconds_left % 60)
	text.text = "%02d:%02d" % [minutes, seconds]
