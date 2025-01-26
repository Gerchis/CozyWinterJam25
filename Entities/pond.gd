extends InteractableArea
class_name Pond

@export var unselected_color : Color = Color("#47888e")
@export var selected_color : Color = Color("#ffffff")

@onready var outline: MeshInstance3D = %Outline

func _on_hover() -> void:
	var new_material := outline.mesh.surface_get_material(0).duplicate()
	new_material.albedo_color = selected_color
	outline.mesh.surface_set_material(0, new_material)

func _off_hover() -> void:
	var new_material := outline.mesh.surface_get_material(0).duplicate()
	new_material.albedo_color = unselected_color
	outline.mesh.surface_set_material(0, new_material)
