extends Node3D

const FLY = preload("res://Entities/Fly.tscn")

@export var min_x := 0.0
@export var max_x := 0.05
@export var min_y := 0.015
@export var max_y := 0.09
@export var z_pos := 0.0

var rng := RandomNumberGenerator.new()

@onready var flies_container: Node3D = %FliesContainer

func _ready() -> void:
	GlobalSignals.go_to_bottle.connect(spawn_flies)

func spawn_flies() ->void:
	for child in flies_container.get_children():
		child.queue_free()
		await child.tree_exited
	
	var flies_count := randi_range(1, 4)
	
	for i in range(flies_count):
		var inst := FLY.instantiate()
		flies_container.add_child(inst)
		inst.global_position = Vector3(rng.randf_range(min_x, max_x), rng.randf_range(min_y, max_y), z_pos)
		inst.animation_player.play(&"Aleteo_001", -1, rng.randf_range(1.0,2.0))
