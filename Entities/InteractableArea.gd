extends Area3D
class_name InteractableArea

var is_hovered : bool = false :
	set(value):
		if value and not is_hovered:
			_on_hover()
		elif not value and is_hovered:
			_off_hover()
		is_hovered = value

func _on_hover() -> void:
	print("OnHover")
	pass

func _off_hover() -> void:
	print("OffHover")
	pass

func _interaction () -> void:
	print("Interaction")
	pass

func _deselect() -> void:
	print("Deselect")
	pass
