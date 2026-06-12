extends Node

@export var papers_node: Control

var isHuman = randi_range(1,2)
var cargo_info = ""
var license_plate_info = ""
var gender_info = ""
var car_type_info = ""
var name_info = ""
var lastname_info = ""
var origin_info = ""
var destination_info = ""

func _ready() -> void:
	randomize()

func _set_info() -> void:
	if isHuman == 1: #HUMANO
		cargo_info = papers_node.paper_cargo
		license_plate_info = papers_node.paper_license_plate
		gender_info = papers_node.paper_gender
		car_type_info = papers_node.paper_car_type
		name_info = papers_node.paper_name
		lastname_info = papers_node.paper_lastname
		origin_info = papers_node.paper_origin
		destination_info = papers_node.paper_destination
	
	if isHuman == 0: #NO HUMANO
		cargo_info = papers_node.get_cargo()
		license_plate_info = papers_node.get_license_plate()
		gender_info = papers_node.get_gender()
		car_type_info = papers_node.get_car_type()
		name_info = papers_node.get_driver_name()
		lastname_info = papers_node.get_driver_lastname()
		origin_info = papers_node.get_origin()
		destination_info = papers_node.get_destination()

	
