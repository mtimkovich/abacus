extends Node2D

onready var Column = preload('res://Column.tscn')
const SIZE = 8
const SPACING = 64
const PADDING = 32

func _ready():
	for i in range(SIZE):
		var column = Column.instance()
		column.position = Vector2(PADDING + i * SPACING, PADDING)
		add_child(column)
