extends CharacterBody2D

@export var speed = 400.0
@export var rotation_speed = 3.0

#var target : Vector2

var rotation_diraction = 0

@onready var target = position

#func _ready() -> void:
	#target = position

#gira com o mouse
func get_mouse_input() -> void:
	look_at(get_global_mouse_position())
	velocity = transform.x * Input.get_axis("down", "up") * speed

#clica pra andar
func _input(event) -> void:
	if event.is_action_pressed(&"click"):
		target = get_global_mouse_position()
	

#gira com as setas avança/volta
func get_rotation_input() -> void:
	rotation_diraction = Input.get_axis("left", "right")
	velocity = transform.x * Input.get_axis("down", "up") * speed

#movimento 8 direções
func get_8way_input() -> void:
	var input_diraction = Input.get_vector("left", "right", "up", "down")
	velocity = input_diraction * speed

func _physics_process(delta: float) -> void:
	get_8way_input()
	
	#get_rotation_input()
	#rotation += rotation_diraction * rotation_speed * delta
	
	#get_mouse_input()
	#velocity = position.direction_to(target) * speed
	#look_at(target)
	#if position.distance_to(target) > 5:
		#move_and_slide()
		
	move_and_slide()
