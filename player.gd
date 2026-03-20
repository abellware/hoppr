extends CharacterBody2D

const SPEED = 800.0
const ACCELERATION = 1000.0
const FRICTION = 1000.0
const JUMP_VELOCITY = -800.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $AnimatedSprite2D

@onready var audio_stream_player_steps: AudioStreamPlayer = $"AudioStreamPlayer_steps"
@onready var audio_stream_player_foley: AudioStreamPlayer = $AudioStreamPlayer_foley

@onready var audio_stream_player_jump: AudioStreamPlayer = $AudioStreamPlayer_jump
@onready var audio_stream_player_squish: AudioStreamPlayer = $AudioStreamPlayer_squish


func _physics_process(delta):
	apply_gravity(delta)
	handle_jump()
	var input_axis = Input.get_axis("ui_left", "ui_right")
	handle_acceleration(input_axis, delta)
	apply_friction(input_axis, delta)
	update_animations(input_axis)
	
	

	
	move_and_slide()

	
	if is_on_floor():
		
		audio_stream_player_squish.play()

func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_jump():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP_VELOCITY
			audio_stream_player_jump.play()
			
	#if not is_on_floor():
		#if Input.is_action_just_released("ui_up") and velocity.y < JUMP_VELOCITY / 2:
			#velocity.y = JUMP_VELOCITY / 2

func handle_acceleration(input_axis, delta):
	if input_axis != 0:
		velocity.x = move_toward(velocity.x, SPEED * input_axis, ACCELERATION * delta)
		if is_on_floor():
			if !audio_stream_player_foley.playing:
				audio_stream_player_foley.play()
			if !audio_stream_player_steps.playing:
				audio_stream_player_steps.play()
				
				
				
	#else: input_axis == 0
	#audio_stream_player_steps.stop()

func apply_friction(input_axis, delta):
	if input_axis == 0:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		


func update_animations(input_axis):
	if input_axis != 0:
		animated_sprite_2d.flip_h = (input_axis < 0)
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")
	if not is_on_floor():
		animated_sprite_2d.play("jump")
	#elif is_on_floor():
		#animated_sprite_2d.play("jump")
