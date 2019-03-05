extends TileMap

var tile_size = get_cell_size()
var half_tile_size = tile_size / 2
onready var Bead = preload('res://Bead.tscn')
var beads = [null]

func _add_bead(y, value):
	var bead = Bead.instance()
	bead.value = value
	bead.grid = self
	bead.position = map_to_world(Vector2(0, y))
	
	if value == 5:
		$Heaven.add_child(bead)
	elif value == 1:
		$Earth.add_child(bead)
		beads.append(bead)
		
func update_value():
	var accumulator = 0
	if $Heaven.get_child(0).active:
		accumulator += 5
	for bead in $Earth.get_children():
		if bead.active:
			accumulator += 1
	
	$Value.text = str(accumulator)
	
func _ready():
	_add_bead(0, 5)
	for i in range(4):
		_add_bead(3+i, 1)
		
	$Value.rect_position = map_to_world(Vector2(0, 7)) - half_tile_size/2
	
func map_to_world(map_position, whatever=false):
	return .map_to_world(map_position, whatever) + half_tile_size