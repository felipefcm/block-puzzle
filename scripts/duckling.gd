class_name Duckling extends RigidBody3D

var duck: Duck

func _ready():
	pass


func _physics_process(delta: float):
	if(global_position.y > 0):
		var target := duck.global_position
		var followForce := (target - global_position) * 20.0
		apply_central_force(followForce * delta)



