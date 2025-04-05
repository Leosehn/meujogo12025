extends Node2D

var total : float = 0

func _ready() -> void:
	update_score(total)

func _process(delta: float) -> void:
	total += delta
	update_score(total)

func _input(event: InputEvent) -> void:
	#print(event.as_text())
	if event.is_action_pressed('ui_right'):
		print("Right Arrow")
		
const SPEED : int = 100
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		position.x += SPEED * delta

func update_score(current_score: float) -> void:
	$Score.text = str(current_score)
