extends Control


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level_1.tscn")
