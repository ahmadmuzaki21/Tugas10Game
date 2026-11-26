extends CharacterBody2D

const LAJU := 300.0
const AKSEL := 1800.0
const GESEKAN := 2200.0
const LOMPAT := -600.0
const COYOTE := 0.1
const BUFFER := 0.1

var t_coyote := 0.0
var t_buffer := 0.0

@onready var gambar: Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	if is_on_floor():
		t_coyote = COYOTE
	else:
		t_coyote -= delta

	velocity += get_gravity() * delta

	if Input.is_action_just_pressed("lompat"):
		t_buffer = BUFFER
	else:
		t_buffer -= delta

	if t_buffer > 0.0 and t_coyote > 0.0:
		velocity.y = LOMPAT
		t_buffer = 0.0
		t_coyote = 0.0

	if Input.is_action_just_released("lompat") and velocity.y < 0.0:
		velocity.y *= 0.5

	var arah := Input.get_axis("kiri", "kanan")
	if arah != 0.0:
		velocity.x = move_toward(velocity.x, arah * LAJU, AKSEL * delta)
		gambar.flip_h = arah < 0.0
	else:
		velocity.x = move_toward(velocity.x, 0.0, GESEKAN * delta)

	move_and_slide()

	if global_position.y > 900.0:
		get_tree().reload_current_scene()
