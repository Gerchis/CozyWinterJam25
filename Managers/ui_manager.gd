extends Control

	#AudioServer.set_bus_volume_db(0, linear_to_db(1.0))
@onready var volume_slider: Slider = %VolumeSlider


func _ready() -> void:
	hide_ui_elements()
	volume_changed(0.5)

func hide_ui_elements() -> void:
	hide_config_dropdown()

func on_config_clicked()-> void:
	if volume_slider.is_visible_in_tree():
		hide_config_dropdown()
	else:
		open_config_dropdown()

func open_config_dropdown() -> void:
	volume_slider.show()

func hide_config_dropdown() -> void:
	volume_slider.hide()

func volume_changed(new_value: float) -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db(new_value))
	%VolumeBar.value = new_value
