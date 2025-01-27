extends Node

signal go_to_garden
signal go_to_river
signal go_to_bottle

signal add_fly

enum FROG_TYPE {
	BASIC,
	PACMAN,
	ROUND,
	HORNED
}

var inventory : Dictionary = {
	"tadpoles":[],
	"frogs": [],
	"flies":0,
	"worms":0,
}
