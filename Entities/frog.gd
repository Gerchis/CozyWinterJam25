extends InteractableArea
class_name Frog

enum FROG_TYPE {
	BASIC,
	PACMAN,
	ROUND,
	HORNED
}
const BASIC_FROG = preload("res://Assets/Models/Animacion_Ranas_001.glb")
const PACMAN_FROG = preload("res://Assets/Models/Animacion_Ranas_002.glb")
const ROUND_FROG = preload("res://Assets/Models/Animacion_Ranas_004.glb")
const HORNED_FROG = preload("res://Assets/Models/Animacion_Ranas_005.glb")

@export var frog_type : FROG_TYPE = FROG_TYPE.BASIC

func _ready() -> void:
	pass
