extends Area2D
class_name Interactable

@export var Visual_Node: CanvasItem

func _ready():
	if Visual_Node != null:
		if Visual_Node.material == null || !Visual_Node.material is ShaderMaterial:
			var shader = load("res://Shader/outline.gdshader")
			var material = ShaderMaterial.new()
			material.shader = shader
			Visual_Node.material = material

func _on_input_event(viewport, event, shape_idx):
	pass

func _on_mouse_entered():
	do_outline(true)

func _on_mouse_exited():
	do_outline(false)

func do_outline(boo: bool):
	
	Visual_Node.material.set_shader_parameter("is_active", boo)
