extends PathFollow2D

# Called when the node enters the scene tree for the first time.
func _process( delta ):
	set_offset( get_offset() + 150 * delta )
