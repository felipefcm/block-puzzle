extends Node3D

@export var playerScene: PackedScene
@onready var initialPlayerPosition := $InitialPlayerPosition as Node3D

var duck: Duck

func _ready():
	spawnPlayer()


func _process(delta: float):
	if(Input.is_action_just_pressed('restart_level')):
		spawnPlayer()

	if(duck.global_position.y <= -4.0): spawnPlayer()


func spawnPlayer():
	if(duck != null): duck.queue_free()

	duck = playerScene.instantiate() as Node3D
	duck.global_position = initialPlayerPosition.global_position

	add_child(duck)

