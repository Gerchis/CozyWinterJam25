extends InteractableArea
class_name Tadpole

@export var upper_limit := 500.0
@export var bottom_limit := -500.0
@export var right_limit := 500.0
@export var left_limit := -500.0
@export var max_depth := 90.0
@export var max_time_wait := 2.0
@export var speed := 2.0

@onready var wait_timer: Timer = $WaitTimer

var on_travel : bool = false
var target_point : Vector3 = Vector3.ZERO
var rng := RandomNumberGenerator.new()
var depth_pos : float

func _ready() -> void:
	set_random_pos()
	get_random_pos()
	wait_timer.timeout.connect(move_again)

func _process(delta: float) -> void:
	if on_travel and wait_timer.is_stopped():
		look_at(target_point)
		global_position = global_position.move_toward(target_point, speed * delta)
	
	if global_position.is_equal_approx(target_point) and wait_timer.is_stopped():
		wait_timer.start(rng.randf() * max_time_wait)
		on_travel = false


func get_random_pos() -> void:
	target_point = Vector3(rng.randf_range(left_limit, right_limit), rng.randf_range(bottom_limit, upper_limit), depth_pos)
	on_travel = true

func move_again() -> void:
	get_random_pos()

func set_random_pos() -> void:
	depth_pos = rng.randf_range(0, -100.0)
	global_position = Vector3(rng.randf_range(left_limit, right_limit), rng.randf_range(bottom_limit, upper_limit), depth_pos)
