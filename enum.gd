extends Node

enum Ingredient_type {HAM, APPLE, LETTUCE, CHEESE, CARROT} 

const dictIngredient = {
	"BEEF": Ingredient_type.HAM,
	"TOMATO": Ingredient_type.APPLE,
	"LETTUCE": Ingredient_type.LETTUCE,
	"CHEESE": Ingredient_type.CHEESE,
	"BREAD": Ingredient_type.CARROT,
}

enum StationType { CRATE, CUTTING_BOARD, STOVE_PAN, STOVE_POT, OVEN, MIXING_STATION, DELIVERY_TABLE, PLATE }

const dictStation = {
	"CRATE": StationType.CRATE,
	"CUTTING_BOARD": StationType.CUTTING_BOARD,
	"STOVE_PAN": StationType.STOVE_PAN,
	"STOVE_POT": StationType.STOVE_POT,
	"OVEN": StationType.OVEN,
	"MIXING_STATION": StationType.MIXING_STATION,
	"DELIVERY_TABLE": StationType.DELIVERY_TABLE,
	"PLATE": StationType.PLATE,
}
