extends CharacterBody2D
@onready var bloop_gang: CharacterBody2D = get_parent().get_node("player")
@onready var player: CharacterBody2D = $"../player"
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animated_sprite_2d_a_level: AnimatedSprite2D = $"AnimatedSprite2D A level"
@onready var animated_sprite_2d_b_level: AnimatedSprite2D = $"AnimatedSprite2D B level"
@onready var animated_sprite_2d_c_level: AnimatedSprite2D = $"AnimatedSprite2D C level"


#@onready var animated_sprite_2d = $AnimatedSprite2D

var speed: float = 175.0
var gravity = 15



func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		#dir = -1

	velocity.x = lerp(velocity.x, -1 * speed, 100.0*delta)
	velocity.y += gravity


	move_and_slide()
