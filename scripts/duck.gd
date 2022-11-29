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

	var dampForce := 6.0 * -velocity * Vector3(1 - absf(input.x), 0, 1 - absf(input.z))
	velocity += (inputAccel * input + dampForce) * delta
	
	if(input != Vector3.ZERO):
		modelNode.look_at(global_position - input, Vector3.UP)

	velocity = velocity.limit_length(maxSpeed)
	
	if(!is_on_floor()):
		velocity.y -= 75 * delta

	move_and_slide()
	
