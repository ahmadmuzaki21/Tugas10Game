extends CanvasLayer

var skor:= 0

func _ready() -> void:
	Events.koin_diambil.connect(_on_koin_diambil)
	
func _on_koin_diambil(jumlah: int) -> void:
	skor += jumlah
	%SkorLabel.text = "Koin: %d" % skor
