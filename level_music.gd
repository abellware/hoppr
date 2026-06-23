extends Node2D

@export var music_event: String = ""

func _ready() -> void:
	if not music_event.is_empty():
		SoundManager.play_music(music_event)
