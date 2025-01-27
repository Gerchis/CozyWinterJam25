extends InteractableArea
class_name CatchTadpole

@export var z_target : float = 0.7
@export var y_pos : float = 0.0
@export var x_min_target : float = 0.0
@export var x_max_taget : float = 0.3
@export var speed : float = 0.5

var rng := RandomNumberGenerator.new()
var target_pos := Vector3.ZERO
var stats : FrogStats = FrogStats.new()

@onready var modelado_cuerpo_renacuajo_001: MeshInstance3D = %Modelado_Cuerpo_Renacuajo_001

func _ready() -> void:
	set_target()

func _process(delta: float) -> void:
	if target_pos != Vector3.ZERO:
		look_at(target_pos)
		global_position = global_position.move_toward(target_pos, speed * delta)
		if global_position.is_equal_approx(target_pos):
			queue_free()

func set_target() -> void:
	target_pos = Vector3(rng.randf_range(x_min_target, x_max_taget), y_pos, z_target)

func set_color() -> void:
	var new_material := modelado_cuerpo_renacuajo_001.mesh.surface_get_material(0).duplicate()
	new_material.albedo_color = stats.main_color
	modelado_cuerpo_renacuajo_001.mesh.surface_set_material(0, new_material) 

func _interaction () -> void:
	stats.catch_timestamp = Time.get_unix_time_from_system()
	GlobalSignals.inventory["tadpoles"].append(stats)
	queue_free()
