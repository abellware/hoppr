extends Node2D

@export var event_path: String = ""

var event_instance: FmodEvent = null

func _ready() -> void:
	if event_path.is_empty():
		return
	event_instance = SoundManager._play_looping_attached(event_path, get_parent())

func _exit_tree() -> void:
	if event_instance != null:
		event_instance.stop(FmodServer.FMOD_STUDIO_STOP_ALLOWFADEOUT)
		event_instance.release()
		event_instance = null
