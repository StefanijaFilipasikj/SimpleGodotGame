extends Node3D

@export var end_screen_scene: PackedScene
@export var hud : CanvasLayer

@onready var timer = $Timer
@onready var timer_label = $HUD/TimerLabel

var time_left = 150

func _ready() -> void:
	Global.coins = 0
	timer.start()
	_update_timer_label(time_left)
	timer.connect("timeout", _on_timer_timeout)


func _process(delta: float) -> void:
	time_left = max(0, timer.time_left)
	_update_timer_label(time_left)


func _on_timer_timeout():
	var end_screen = end_screen_scene.instantiate()
	end_screen.get_node("Message").text = str("Time is Up!")
	timer.stop()
	get_tree().current_scene.add_child(end_screen)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE	


func _on_fall_zone_body_entered(body: Node3D) -> void:
	var end_screen = end_screen_scene.instantiate()
	end_screen.get_node("Message").text = str("Game Over!")
	timer.stop()
	get_tree().current_scene.add_child(end_screen)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE	


func _update_timer_label(time_left) -> void:
	var minutes = int(time_left) / 60
	var seconds = int(time_left) % 60
	timer_label.text = "Time Left: %02d:%02d" % [minutes, seconds]
