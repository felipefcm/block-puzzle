extends Node3D

@export var playerScene: PackedScene
@onready var initialPlayerPosition := $InitialPlayerPosition as Node3D

@export var ducklingScene: PackedScene
@onready var ducklingSpawnPoint = $DucklingSpawnPoint as Node3D

var duck: Duck
var ducklings: Array[Duckling]

func _ready():
	spawnPlayer()
	spawnDucklings()


func _process(delta: float):
	if(Input.is_action_just_pressed('restart_level')):
		spawnPlayer()

	if(duck.global_position.y <= -4.0): spawnPlayer()
	
	for duckling in ducklings:
		if(is_instance_valid(duckling) and duckling.global_position.y <= -10.0):
			duckling.queue_free()


func spawnPlayer():
	if(duck != null): duck.queue_free()

	duck = playerScene.instantiate() as Node3D
	
	add_child(duck)
	duck.global_position = initialPlayerPosition.global_position


func spawnDucklings():
	var ducklingGroup = ducklingScene.instantiate()
	add_child(ducklingGroup)
	ducklingGroup.global_position = ducklingSpawnPoint.global_position

	var dls = ducklingGroup.get_children()

	for duckling in dls:
		duckling.duck = duck	
		ducklings.push_back(duckling)

