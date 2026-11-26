extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	Events.koin_diambil.emit(1)
	queue_free()
