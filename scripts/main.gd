extends Node2D

const KOIN := preload("res://scenes/koin.tscn")
const POSISI_KOIN := [
	Vector2(350, 600),
	Vector2(550, 470),
	Vector2(950, 350),
]

@onready var wadah: Node2D = $Koin

func _ready() -> void:
	for pos in POSISI_KOIN:
		var koin: Node2D = KOIN.instantiate()
		koin.position = pos
		wadah.add_child(koin)
