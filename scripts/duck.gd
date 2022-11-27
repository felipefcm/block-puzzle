class_name Duck extends Node3D

@onready var modelNode = $Model as Node3D

func _ready():
	pass

func _process(delta):
	var input := Vector3(
		Input.get_axis('ui_left', 'ui_right'),
		0,
		-Input.get_axis('ui_down', 'ui_up'),
	).rotated(Vector3(0, 1, 0), -PI / 4.0)

	translate_object_local(input * 10.0 * delta)

	if(input.length() > 0):
		var angle := input.signed_angle_to(Vector3(1, 0, 0), Vector3(0, -1, 0))
		modelNode.rotation.y = PI / 2.0 + angle

