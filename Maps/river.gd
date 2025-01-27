extends Node3D

const CATCH_TADPOLE = preload("res://Entities/Catch_tadpole.tscn")

@export var min_time := 1.0
@export var max_time := 4.0
@export var min_x_pos := -0.2
@export var max_x_pos := 0
@export var z_pos := -0.6

var rng := RandomNumberGenerator.new()

func _ready() -> void:
	get_tree().create_timer(rng.randf_range(min_time, max_time)).timeout.connect(spawn_new_tadpole)

func spawn_new_tadpole() -> void:
	var inst = CATCH_TADPOLE.instantiate()
	add_child(inst)
	inst.global_position = Vector3(rng.randf_range(min_x_pos, max_x_pos), 0, z_pos)
	inst.stats.main_color = Color.from_hsv(rng.randf(), 1.0, 0.6)
	inst.stats.frog_type = rng.randi_range(0, 3)
	inst.set_color()
	
	get_tree().create_timer(rng.randf_range(min_time, max_time)).timeout.connect(spawn_new_tadpole)
