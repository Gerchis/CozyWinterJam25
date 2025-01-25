extends Camera3D

@export var ray_lenght := 100

var focused_area : InteractableArea : 
	set(value):
		if value == null and focused_area != null:
			focused_area.is_hovered = false
		elif value != null and focused_area == null:
			value.is_hovered = true
		focused_area = value

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("lmb") and focused_area != null:
		focused_area._interaction()
	
	if Input.is_action_just_released("lmb") and focused_area != null:
		focused_area._deselect()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var raycast_data = check_raycast()
		if raycast_data.is_empty() or raycast_data["collider"] is not InteractableArea:
			focused_area = null
			return
		
		if focused_area != null and focused_area != raycast_data["collider"]:
			focused_area = null
		
		focused_area = raycast_data["collider"]

func check_raycast() -> Dictionary:
	var mouse_pos := get_viewport().get_mouse_position()
	var from = project_ray_origin(mouse_pos)
	var to = from + project_ray_normal(mouse_pos) * ray_lenght
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.create(from, to)
	ray_query.collide_with_areas = true
	var raycast_result := space.intersect_ray(ray_query)
	
	return raycast_result
