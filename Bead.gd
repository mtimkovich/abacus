extends Node2D

var grid
onready var coordinates = grid.world_to_map(position)

var value
var active = false

func move():
	if value == 5:
		coordinates.y = 1 - coordinates.y
		position = grid.map_to_world(coordinates)

	elif value == 1:
		var move_direction = -1
		
		if active:
			move_direction = 1
		
		var index = coordinates.y - 2
		coordinates.y += move_direction
		var next = index + move_direction
		
		position = grid.map_to_world(coordinates)
		var next_bead = grid.beads[next]
		if next_bead != null:
			next_bead.move()
		grid.beads[index] = null
		grid.beads[next] = self
		
	active = not active

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed('ui_clicked_left'):
		move()
		grid.update_value()
