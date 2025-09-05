extends CanvasLayer
@onready var crt: ColorRect = $CRT

func hide_crt():
	crt.hide()
	
func show_crt():
	crt.show()
