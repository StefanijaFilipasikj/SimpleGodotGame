extends Area3D

const ROT_SPEED = 2
@export var hud : CanvasLayer
@export var end_screen_scene: PackedScene

@onready var coin_sound: AudioStreamPlayer3D = %CoinPickup

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	rotate_y(deg_to_rad(ROT_SPEED))


func _on_body_entered(body: Node3D) -> void:
	coin_sound.play()
	Global.coins += 1
	hud.get_node("CoinsLabel").text = str(Global.coins)
	if(Global.coins >= Global.NUM_COINS_TO_WIN):
		var end_screen = end_screen_scene.instantiate()
		get_tree().change_scene_to_file("res://end_screen.tscn")	
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE	
		
	set_collision_layer_value(3, false)
	set_collision_mask_value(1, false)
	$AnimationPlayer.play("bounce")


func _on_bounce_animation_finished(anim_name: StringName) -> void:
	queue_free()
