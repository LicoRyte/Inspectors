extends Camera2D
class_name AdvancedCamera


var main_point: Vector2 = Vector2(640.0, 360.0)
var starting_point: Vector2 = Vector2(640.0, 360.0)

func _ready() -> void:
	GameManager.set_main_cam(self)

func _process(delta: float) -> void:
	global_position = main_point


func zoom_to(selected_object: Employee) -> void:
	main_point = lerp(global_position, selected_object.global_position - Vector2(120,0), get_process_delta_time() * 12)
	zoom.x = move_toward(zoom.x, 1.5, get_process_delta_time() * 12)
	zoom.y = move_toward(zoom.y, 1.5, get_process_delta_time() * 12)
	
func zoom_out():
	main_point = lerp(global_position, starting_point , get_process_delta_time() * 12)
	zoom = lerp(zoom, Vector2(1.0,1.0), get_process_delta_time() * 12)
