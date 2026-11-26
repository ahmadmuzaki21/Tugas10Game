extends CharacterBody2D

const LAJU := 300.0
const LOMPAT := -600.0

@onready var gambar: Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("lompat") and is_on_floor():
		velocity.y = LOMPAT

	var arah := Input.get_axis("kiri", "kanan")
	velocity.x = arah * LAJU
	if arah != 0.0:
		gambar.flip_h = arah < 0.0

	move_and_slide()

	if global_position.y > 900.0:
		get_tree().reload_current_scene()
