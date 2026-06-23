extends Node

# SoundManager autoload for FMOD event playback.
# All AudioStreamPlayer usage in the game is replaced by calls to this singleton.
# FMOD banks must be exported from FMOD Studio to res://FModBank/Desktop/.
# Required banks: Master.bank, Master.strings.bank, Music.bank, SFX.bank.

const BANKS_PATH: String = "res://FModBank/Desktop/"
const MASTER_BANK: String = BANKS_PATH + "Master.bank"
const MASTER_STRINGS_BANK: String = BANKS_PATH + "Master.strings.bank"
const MUSIC_BANK: String = BANKS_PATH + "Music.bank"
const SFX_BANK: String = BANKS_PATH + "SFX.bank"

var loaded_banks: Array = []
var music_instance: FmodEvent = null
var enable_fmod: bool = true


func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS
	if not enable_fmod:
		print("SoundManager: FMOD disabled. No banks loaded.")
		return
	_load_banks()


func _load_banks() -> void:
	loaded_banks.clear()
	if not DirAccess.dir_exists_absolute(BANKS_PATH):
		print("SoundManager: FMOD banks folder not found at " + BANKS_PATH + ". Audio will be silent until banks are exported.")
		return
	
	var required := [MASTER_BANK, MASTER_STRINGS_BANK, MUSIC_BANK, SFX_BANK]
	for bank_path in required:
		if not FileAccess.file_exists(bank_path):
			print("SoundManager: FMOD bank missing: " + bank_path)
			continue
		var bank = FmodServer.load_bank(bank_path, FmodServer.FMOD_STUDIO_LOAD_BANK_NORMAL)
		if bank != null:
			loaded_banks.append(bank)
			print("SoundManager: Loaded bank " + bank_path)
	
	if loaded_banks.is_empty():
		print("SoundManager: No FMOD banks loaded. Audio will be silent until banks are exported.")


func _get_fmod_ready() -> bool:
	if not enable_fmod:
		return false
	if loaded_banks.is_empty():
		# Try to load banks if they appeared after _ready.
		if FileAccess.file_exists(MASTER_BANK):
			_load_banks()
	return not loaded_banks.is_empty()


func play_sfx(event_path: String, position: Vector2 = Vector2.ZERO) -> void:
	if not _get_fmod_ready():
		return
	var event: FmodEvent = FmodServer.create_event_instance(event_path)
	if event == null:
		print("SoundManager: Failed to create FMOD event: " + event_path)
		return
	event.set_2d_attributes(Transform2D(0, position))
	event.start()
	event.release()


func play_sfx_attached(event_path: String, node: Node2D) -> void:
	if not _get_fmod_ready():
		return
	var event: FmodEvent = FmodServer.create_event_instance(event_path)
	if event == null:
		print("SoundManager: Failed to create FMOD event: " + event_path)
		return
	if node != null:
		event.set_2d_attributes(node.global_transform)
	event.start()
	event.release()


func play_music(event_path: String) -> void:
	if not _get_fmod_ready():
		return
	stop_music()
	music_instance = FmodServer.create_event_instance(event_path)
	if music_instance == null:
		print("SoundManager: Failed to create music event: " + event_path)
		return
	music_instance.start()


func stop_music() -> void:
	if music_instance != null:
		music_instance.stop(FmodServer.FMOD_STUDIO_STOP_ALLOWFADEOUT)
		music_instance.release()
		music_instance = null


func play_ui(event_path: String) -> void:
	play_sfx(event_path)


# Convenience wrappers for common game sounds.
func play_jump(position: Vector2 = Vector2.ZERO) -> void:
	play_sfx(FmodEvents.PLAYER_JUMP, position)


func play_step(position: Vector2 = Vector2.ZERO) -> void:
	play_sfx(FmodEvents.PLAYER_STEP, position)


func play_foley(position: Vector2 = Vector2.ZERO) -> void:
	play_sfx(FmodEvents.PLAYER_FOLEY, position)


func play_squish(position: Vector2 = Vector2.ZERO) -> void:
	play_sfx(FmodEvents.PLAYER_SQUISH, position)


func play_land(position: Vector2 = Vector2.ZERO) -> void:
	play_sfx(FmodEvents.PLAYER_LAND, position)


func play_coin(position: Vector2 = Vector2.ZERO) -> void:
	play_sfx(FmodEvents.COIN, position)


func play_splut(position: Vector2 = Vector2.ZERO) -> void:
	play_sfx(FmodEvents.SPLUT, position)


func play_squeak(position: Vector2 = Vector2.ZERO) -> void:
	play_sfx(FmodEvents.SQUEAK, position)


func play_flap(position: Vector2 = Vector2.ZERO) -> void:
	play_sfx(FmodEvents.FLAP, position)


func play_greeble(position: Vector2 = Vector2.ZERO) -> void:
	play_sfx(FmodEvents.GREEBLE, position)


func play_bloop_ambient(node: Node2D) -> FmodEvent:
	return _play_looping_attached(FmodEvents.BLOOP_AMBIENT, node)


func play_bloop_march(node: Node2D) -> FmodEvent:
	return _play_looping_attached(FmodEvents.BLOOP_MARCH, node)


func _play_looping_attached(event_path: String, node: Node2D) -> FmodEvent:
	if not _get_fmod_ready():
		return null
	var event: FmodEvent = FmodServer.create_event_instance(event_path)
	if event == null:
		return null
	if node != null:
		event.set_2d_attributes(node.global_transform)
	event.start()
	return event
