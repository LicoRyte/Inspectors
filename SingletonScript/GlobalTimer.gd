extends Node

var timer: Timer = Timer.new()
var clock_time: int = 0

func _ready() -> void:
	add_child(timer)
	timer.one_shot = false
	timer.wait_time = 1.0   # tick every second
	timer.timeout.connect(_on_timeout)

func add_time(time: int):
	clock_time = time
	timer.start()

func _on_timeout():
	if clock_time > 0:
		clock_time -= 1
	else:
		timer.stop()
		Events.emit_signal("_on_shift_ended")
