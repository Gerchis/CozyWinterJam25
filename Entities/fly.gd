extends InteractableArea

@onready var animation_player: AnimationPlayer = %AnimationPlayer

func _interaction () -> void:
	GlobalSignals.add_fly.emit()
	queue_free()
