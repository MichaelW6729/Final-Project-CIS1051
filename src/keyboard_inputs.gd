extends Node2D

signal move

func _unhandled_input(event):
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_UP:
				emit_signal("move", Vector2(0, -1))
			KEY_DOWN:
				emit_signal("move", Vector2(0, 1))
			KEY_LEFT:
				emit_signal("move", Vector2(-1, 0))
			KEY_RIGHT:
				emit_signal("move", Vector2(1, 0))
