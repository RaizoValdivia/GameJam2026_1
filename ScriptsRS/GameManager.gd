extends Node2D

#------ Control --------
@onready var bus_1: Button = $Control/Bus1
@onready var bus_2: Button = $Control/Bus2
@onready var bus_3: Button = $Control/Bus3

@onready var sprite_bus_1: Sprite2D = $Control/Bus1/SpriteBus1
@onready var sprite_bus_2: Sprite2D = $Control/Bus2/SpriteBus2
@onready var sprite_bus_3: Sprite2D = $Control/Bus3/SpriteBus3

# ----- Constante de dialogo ------
const DIALOGUE_EXAMPLE_1 = preload("uid://cct04k5wr84a3")

# -------- Variables --------- 
var isDialogueActive: bool = false
var numBusses: int = 0


func _ready() -> void:
	DialogueManager.dialogue_started.connect(on_dialogue_started)
	DialogueManager.dialogue_ended.connect(on_dialogue_ended)
	
	bus_2.disabled = true
	bus_3.disabled = true
	sprite_bus_2.hide()
	sprite_bus_3.hide()

func _process(delta: float) -> void:
	if numBusses == 1:
		bus2_spawn()
	elif numBusses == 2:
		bus3_spawn()
	elif numBusses == 0:
		bus1_spawn()
#-------- Funciones de botones -------
func _on_bus_1_pressed() -> void:
	print("Botón 1 Presionado")
	numBusses += 1
func _on_bus_2_pressed() -> void:
	print("Botón 2 Presionado")
	numBusses += 1
func _on_bus_3_pressed() -> void:
	print("Botón 3 Presionado")
	if isDialogueActive == false:
		DialogueManager.show_dialogue_balloon(DIALOGUE_EXAMPLE_1, "start")
	await get_tree().create_timer(3.5).timeout
	numBusses = 0
# ----- Funciones de dialogo -------
func on_dialogue_started(dialogue) -> void:
	isDialogueActive = true
func on_dialogue_ended(dialogue) -> void:
	isDialogueActive = false
	bus1_spawn()
 
#----- Spawn de busses -------------
func bus1_spawn() -> void:
	bus_1.disabled = false
	sprite_bus_1.show()
	bus_3.disabled = true
	sprite_bus_3.hide()
func bus2_spawn() -> void:
	bus_1.disabled = true
	sprite_bus_1.hide()
	bus_2.disabled = false
	sprite_bus_2.show()
func bus3_spawn() -> void:
	bus_2.disabled = true
	sprite_bus_2.hide()
	bus_3.disabled = false
	sprite_bus_3.show()
