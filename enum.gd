extends Node

enum Ingredient_type {RICE, NORI, FISH, CUCUMBER, BEEF, TOMATO, LETTUCE, CHEESE, CARROT, BREAD, POTATO, BURGER, SOUP, SUSHI, COOKED_RICE, FISH_CUT, CUCUMBER_CUT, COOKED_BEEF, TOMATO_CUT, LETTUCE_CUT, POTATO_CUT} 

const dictIngredient = {
	"RICE": Ingredient_type.RICE,
	"NORI": Ingredient_type.NORI,
	"FISH": Ingredient_type.FISH,
	"CUCUMBER": Ingredient_type.CUCUMBER,
	"BEEF": Ingredient_type.BEEF,
	"TOMATO": Ingredient_type.TOMATO,
	"LETTUCE": Ingredient_type.LETTUCE,
	"CHEESE": Ingredient_type.CHEESE,
	"CARROT": Ingredient_type.CARROT,
	"BREAD": Ingredient_type.BREAD,
	"POTATO": Ingredient_type.POTATO,
	"BURGER": Ingredient_type.BURGER,
	"SOUP": Ingredient_type.SOUP,
	"SUSHI": Ingredient_type.SUSHI,
	"COOKED_BEEF": Ingredient_type.COOKED_BEEF,
	"COOKED_RICE": Ingredient_type.COOKED_RICE,
	"FISH_CUT": Ingredient_type.FISH_CUT,
	"CUCUMBER_CUT": Ingredient_type.CUCUMBER_CUT,
	"TOMATO_CUT": Ingredient_type.TOMATO_CUT,
	"LETTUCE_CUT": Ingredient_type.LETTUCE_CUT,
	"POTATO_CUT": Ingredient_type.POTATO_CUT,
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
