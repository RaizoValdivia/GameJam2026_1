extends Control

var random_cargo : Array[String] = [
	"Turistas",
	"Locales",
	"Familia",
	"Solo"
]
var random_gender : Array[String] = [
	"H", "M"
]

var random_lastname : Array[String] = [
	"RODRIGUEZ", "VARGAS", "YUPANQUI", "GARCIA", "FLORES", "TORRES", "SALAZAR", "ROJAS", "CORNEJO", "DELGADO", "PACHECO", "BENAVIDES", "RIVERA", "DEL CAMPO", "ROMERO", "BUSTAMANTE", "CASTRO", "DIAZ", "CHAVEZ", "ESPINOZA", "HERRERA", "MENDOZA", "MORALES", "GONZALES", "SANCHEZ", "RUIZ", "LARCO", "VALDIVIA", "PEREZ", "RAMIREZ",
	"APAZA", "ATAHUALPA", "ATUSPARIA", "CAPUÑAY", "CHERO", "CUSICANQUI", "COLLQUE", "CONDORI", "QUESQUEN", "FARROÑAY", "GARNIQUE", "HUAMAN", "HUARAC", "INGA", "IPANAQUE", "JULCA", "JARA", "YAUCE", "LLUNTOP", "MAMANI", "MALLQUI", "NERIO", "OLAYA", "PISCOYA", "PUYCAN", "QUISPE", "QUEPUY", "RUPAY", "SUYSUY", "TULLUME", "VERA", "YAIPEN", "ZARPAN"
]

var random_name_m : Array[String] = [
	"MARIA", "ROSA", "CARMEN", "ANA", "LUZ", "JUANA", "JULIA", "RUTH", "FLOR", "DIANA", "MILAGROS", "GABRIELA", "LAURA", "SOFIA", "PAZ", "LUZ", "NICOLE", "CAMILA", "FERNANDA", "MICHELLE", "DANIELA", "DORIS", "ALBA", "DEBORA", "DAISY", "DINA", "ELENA", "CAROL", "JENNIFER", "PAMELA", "LISA", "SUSANA", "NOELIA", "VANESA", 
]

var random_name_h : Array[String] = [
	"LIAM", "THIAGO", "DYLAN", "MATEO", "LUIS", "JUAN", "ANGEL", "LUCAS", "JOSE", "GABRIEL", "SANTIAGO", "MATEO", "LUCAS", "SEBASTIAN", "MARTIN", "CARLOS", "ANTHONY", "SERGIO", "JORGE", "CESAR", "JESUS", "PEDRO", "MANUEL", "SANTOS", "MARCO", "FERNANDO", "ALEJANDRO", "ALEX"
]

var random_name : Array[String] = [
	"LIAM", "THIAGO", "DYLAN", "MATEO", "LUIS", "JUAN", "ANGEL", "LUCAS", "JOSE", "GABRIEL", "SANTIAGO", "MATEO", "LUCAS", "SEBASTIAN", "MARTIN", "CARLOS", "ANTHONY", "SERGIO", "JORGE", "CESAR", "JESUS", "PEDRO", "MANUEL", "SANTOS", "MARCO", "FERNANDO", "ALEJANDRO", "ALEX",
	"MARIA", "ROSA", "CARMEN", "ANA", "LUZ", "JUANA", "JULIA", "RUTH", "FLOR", "DIANA", "MILAGROS", "GABRIELA", "LAURA", "SOFIA", "PAZ", "LUZ", "NICOLE", "CAMILA", "FERNANDA", "MICHELLE", "DANIELA", "DORIS", "ALBA", "DEBORA", "DAISY", "DINA", "ELENA", "CAROL", "JENNIFER", "PAMELA", "LISA", "SUSANA", "NOELIA", "VANESA"
]

var random_car_type : Array[String] = [
	"PARTICULAR", "COMBI", "COLECTIVO", "MICRO", "BUS TURISTICO"
]

var random_origin : Array[String] = [
	"CHACHAPOYAS", "HUARAZ", "ABANCAY", "AREQUIPA", "AYACUCHO", "CAJAMARCA", "CALLAO", "CUSCO", "HUANCAVELICA", "HUANUCO", "ICA", "HUANCAYO", "TRUJILLO", "CHICLAYO", "LIMA", "IQUITOS", "PUERTO MALDONADO", " MOQUEGUA", "CERRO DE PASCO", "PIURA", "PUNO", "MOYOBAMBA", "TACNA", "TUMBES", "PUCALLPA"
]

var random_destination : Array[String] = [
	"CHACHAPOYAS", "HUARAZ", "ABANCAY", "AREQUIPA", "AYACUCHO", "CAJAMARCA", "CALLAO", "CUSCO", "HUANCAVELICA", "HUANUCO", "ICA", "HUANCAYO", "TRUJILLO", "CHICLAYO", "LIMA", "IQUITOS", "PUERTO MALDONADO", " MOQUEGUA", "CERRO DE PASCO", "PIURA", "PUNO", "MOYOBAMBA", "TACNA", "TUMBES", "PUCALLPA"
]

@onready var paper_cargo: Button = $Papers/Cargo
@onready var paper_gender: Button = $Papers/Gender
@onready var paper_license_plate: Button = $Papers/LicensePlate
@onready var paper_name: Button = $Papers/DriverName
@onready var paper_lastname: Button = $Papers/DriverLastName
@onready var paper_car_type: Button = $Papers/CarType
@onready var paper_origin: Button = $Papers/Origin
@onready var paper_destination: Button = $Papers/Destination

func _ready() -> void:
	randomize()
	change_menu_text()
	
func change_menu_text() -> void:
	var random_index_cargo = randi() % random_cargo.size()
	paper_cargo.text = random_cargo[random_index_cargo]
	var random_index_gender = randi() % random_gender.size()
	paper_gender.text = random_gender[random_index_gender]
	if random_index_gender == 0:
		var random_index_name_h = randi() % random_name_h.size()
		paper_name.text = random_name_h[random_index_name_h]
	if random_index_gender == 1:
		var random_index_name_m = randi() % random_name_m.size()
		paper_name.text = random_name_m[random_index_name_m]
	var random_index_lastname = randi() % random_lastname.size()
	paper_lastname.text = random_lastname[random_index_lastname]
	var random_index_car_type = randi() % random_car_type.size()
	paper_car_type.text = random_car_type[random_index_car_type]
	var random_index_origin = randi() % random_origin.size()
	paper_origin.text = random_origin[random_index_origin]
	var random_index_destination = randi() % random_destination.size()
	paper_destination.text = random_destination[random_index_destination]
	var license_plate = ""
	for i in range (3):
		license_plate += char(randi_range(65, 90))
	for i in range (3):
		license_plate += char(randi_range(48, 57))
	paper_license_plate.text = license_plate
		
func get_cargo():
	var random_index_cargo = randi() % random_cargo.size()
	return random_cargo[random_index_cargo]
	
func get_gender():
	var random_index_gender = randi() % random_gender.size()
	return random_gender[random_index_gender]
	
func get_license_plate():
	var license_plate_off = ""
	for i in range (3):
		license_plate_off += char(randi_range(65, 90))
	for i in range (3):
		license_plate_off += char(randi_range(48, 57))
	return license_plate_off

func get_driver_lastname():
	var random_index_lastname = randi() % random_lastname.size()
	return random_lastname[random_index_lastname]
	
func get__driver_name():
	var random_index_name = randi() % random_name.size()
	return random_name[random_index_name]
	
func get_car_type():
	var random_index_car_type = randi() % random_car_type.size()
	return random_car_type[random_index_car_type]
	
func get_origin():
	var random_index_origin = randi() % random_origin.size()
	return random_origin[random_index_origin]
	
func get_destination():
	var random_index_destination = randi() % random_destination.size()
	return random_destination[random_index_destination]
