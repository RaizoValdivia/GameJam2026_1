extends ProgressBar

@export var coffe_time: float = 15.0
@export var coffe_timer: float = 0.0

var EndTimer: bool = false

@onready var progress_bar: ProgressBar = $"."
@onready var coffe_button: Button = $"../CoffeButton"


func _ready() -> void:
	coffe_timer = coffe_time
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_bar.value = coffe_timer
	if EndTimer == false:
		coffe_timer -= delta
	if coffe_timer <= 0:
		EndTimer = true
		coffe_timer = coffe_time
	

func _on_coffe_button_pressed() -> void:
	coffe_timer = coffe_timer + 1.0
