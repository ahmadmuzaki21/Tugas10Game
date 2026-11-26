extends CharacterBody2D

const LAJU := 250.0

func _physics_process(_delta: float) -> void:
	velocity = Input.get_vector("kiri", "kanan", "atas", "bawah") * LAJU
	move_and_slide()
