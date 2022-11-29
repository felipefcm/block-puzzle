class_name Duck extends CharacterBody3D

@onready var modelNode = $Model as Node3D

const inputAccel := 15.0
const maxSpeed := 12.0

func _ready():
	pass

func _physics_process(delta: float):
	var input := Vector3(
		Input.get_axis('ui_left', 'ui_right'),
		0,
		-Input.get_axis('ui_down', 'ui_up'),
	).rotated(Vector3.UP, -PI / 4.0).normalized()

	var dampForce := 6.0 * -velocity * Vector3(1 - absf(input.x), 1, 1 - absf(input.z))
	velocity += (inputAccel * input + dampForce) * delta
	
	if(input.length() > 0):
		var angle := input.signed_angle_to(Vector3(1, 0, 0), Vector3(0, -1, 0))
		modelNode.rotation.y = PI / 2.0 + angle

	velocity = velocity.limit_length(maxSpeed)
	velocity.y = -9.8
	# print('VEL ', velocity)
	move_and_slide()
	
