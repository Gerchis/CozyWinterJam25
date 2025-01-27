extends Control

@onready var volume_slider: Slider = %VolumeSlider
@onready var garden: SubViewportContainer = %Garden
@onready var river: SubViewportContainer = %River
@onready var back_button: TextureButton = %BackButton
@onready var bottle: SubViewportContainer = %Bottle

func _ready() -> void:
	hide_ui_elements()
	volume_changed(0.5)
	
	GlobalSignals.go_to_garden.connect(change_to_garden)
	GlobalSignals.go_to_river.connect(change_to_river)
	GlobalSignals.go_to_bottle.connect(change_to_bottle)
	
	GlobalSignals.add_fly.connect(add_fly)


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
	new_value = abs(new_value)
	AudioServer.set_bus_volume_db(0, linear_to_db(new_value))
	%VolumeBar.value = new_value

func hide_all_scenes() -> void:
	back_button.disabled = false
	garden.hide()
	river.hide()
	bottle.hide()

func change_to_garden() -> void:
	hide_all_scenes()
	garden.show()
	back_button.disabled = true

func change_to_river() -> void:
	hide_all_scenes()
	river.show()

func change_to_bottle() -> void:
	hide_all_scenes()
	bottle.show()

func add_fly() -> void:
	GlobalSignals.inventory["flies"] += 1
