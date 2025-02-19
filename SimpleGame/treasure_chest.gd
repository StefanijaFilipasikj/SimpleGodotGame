extends Area3D

@export var hud : CanvasLayer
@export var end_screen_scene: PackedScene

@onready var treasure_sound: AudioStreamPlayer3D = %TreasureChestPickup

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	treasure_sound.play()
	Global.coins += 10
	hud.get_node("CoinsLabel").text = str(Global.coins)
	if(Global.coins >= Global.NUM_COINS_TO_WIN):
		var end_screen = end_screen_scene.instantiate()
		get_tree().change_scene_to_file("res://end_screen.tscn")	
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE	
	queue_free()
