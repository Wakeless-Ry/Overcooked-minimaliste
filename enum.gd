extends Node

enum Ingredient_type {HAM, TOMATO, LETTUCE, CHEESE, CARROT, BREAD, POTATO, BURGER, SOUP, SUSHI} 

const dictIngredient = {
	"BEEF": Ingredient_type.HAM,
	"TOMATO": Ingredient_type.TOMATO,
	"LETTUCE": Ingredient_type.LETTUCE,
	"CHEESE": Ingredient_type.CHEESE,
	"CARROT": Ingredient_type.CARROT,
	"BREAD": Ingredient_type.BREAD,
	"POTATO": Ingredient_type.POTATO,
	"BURGER": Ingredient_type.BURGER,
	"SOUP": Ingredient_type.SOUP,
	"SUSHI": Ingredient_type.SUSHI,
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
