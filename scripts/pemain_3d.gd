extends CharacterBody3D

const LAJU := 5.0
const LOMPAT := 4.5
const SENS := 0.003

@onready var kepala: Node3D = $Kepala

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * SENS)
		kepala.rotate_x(-event.relative.y * SENS)
		kepala.rotation.x = clampf(kepala.rotation.x, -1.4, 1.4)
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("lompat") and is_on_floor():
		velocity.y = LOMPAT
	var masukan := Input.get_vector("kiri", "kanan", "maju", "mundur")
	var gerak := Vector3(masukan.x, 0.0, masukan.y)
	var arah := (transform.basis * gerak).normalized()
	velocity.x = arah.x * LAJU
	velocity.z = arah.z * LAJU
	move_and_slide()
