extends Node2D


var width := 4
var height := 4
var board := []
var x_start := 148
var y_start := 92
var offset := 100
var four_piece_chance := 25


@export var two_piece : PackedScene
@export var four_piece : PackedScene
@export var background_piece : PackedScene

func _ready():
	randomize()
	board = make_array()
#	generate_background()
	generate_new_pieces()
func make_array():
	var board = []
	for i in width:
		board.append([])
		for j in height:
			board[i].append(null)
	return board



func grid_to_pixel(grid_pos: Vector2) -> Vector2:
	var tile_size = 100
	var tile_spacing = 10
	var grid_size = 4
	var total_size = grid_size * tile_size + (grid_size - 1) * tile_spacing

	# Get top-left starting point to center the grid in the parent Node2D
	var start_x = (500 - total_size) / 2
	var start_y = (600 - total_size) / 2

	var x = start_x + grid_pos.x * (tile_size + tile_spacing)
	var y = start_y + grid_pos.y * (tile_size + tile_spacing)
	return Vector2(x, y)


"""func grid_to_pixel(grid_position: Vector2):
	var new_x = x_start + offset * grid_position.x
	var new_y = y_start + -offset * grid_position.y
	return Vector2(new_x, new_y)
"""
func pixel_to_grid(pixel_position: Vector2):
	var new_x = round((pixel_position.x - x_start) / offset)
	var new_y = round((pixel_position.y - y_start) / -offset)
	return Vector2(new_x, new_y)
func is_in_grid(grid_position: Vector2):
	if grid_position.x >= 0 && grid_position.x < width:
		if grid_position.y >= 0 && grid_position.y < height:
			return true
	return false

func is_blank_space():
	for i in width:
		for j in height:
			if board[i][j] == null:
				return true
	return false
#The functions above help with getting the grid visible
#While all functions in this code were inspired from many youtube videos,
#the section of code above is in no way mine
#I STOLE THESE FROM MULTIPLE YOUTUBE TUTORIALS AND ADJUSTED THEM FOR MY GRID
#THEY ARE NOT MY ORIGINAL CODE, I REPEAT THEY ARE NOT MINE

func move_pieces(direction: Vector2):
	#if Input.action_press("ui_left"):
		pass
	


func random_piece():
	var choice = randi_range(0,100)
	if choice <= four_piece_chance:
		return four_piece
	else:
		return two_piece
	

func generate_new_pieces():
	if is_blank_space():
		var pieces_made = 0
		#var piece_selection = random_piece()
		while pieces_made < 2:
			var x_position = randi_range(0,3)
			var y_position = randi_range(0,3)
			if board[x_position][y_position] == null:
				var temp = random_piece().instantiate()
				add_child(temp)
				board[x_position][y_position] = temp
				temp.position = grid_to_pixel(Vector2(x_position, y_position))
				pieces_made += 1



func _on_touch_inputs_move(direction: Vector2):
	return move_pieces(direction)
	
func _on_keyboard_inputs_move(direction: Vector2):
	return move_pieces(direction)
	
