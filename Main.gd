extends Node2D

onready var Column = preload('res://Column.tscn')
const SIZE = 8
const SPACING = 70

func _ready():
	for i in range(SIZE):
		var column = Column.instance()
		column.position = Vector2(250+i*SPACING, 100)
		add_child(column)
