extends Node3D

@onready var layer_3: MeshInstance3D = %Layer3
@onready var layer_2: MeshInstance3D = %Layer2
@onready var layer_1: MeshInstance3D = %Layer1
@onready var dig: InteractableArea = %Dig

func regenerate_floor () -> void:
	layer_1.show()
	layer_2.show()
	layer_3.show()
