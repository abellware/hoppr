extends Area2D

@export var splut : AudioStream
@onready var audio = $"../AudioStreamPlayer_splut2"
@onready var splut2: AudioStreamPlayer = $"../AudioStreamPlayer_splut2" 


func _on_body_entered(_body):
	splut2.play()
	queue_free()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
