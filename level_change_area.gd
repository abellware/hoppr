extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
	
#above is original script
#below is orange script

@export var coingrab : AudioStream
@onready var audio = $AudioStreamPlayer
@onready var coin: AudioStreamPlayer = $"../coin"


func _on_body_entered(_body):
	coin.play()
	queue_free()
	var Oranges = get_tree().get_nodes_in_group("Oranges")
	print(Oranges.size())
	
	if Oranges.size() == 1:
		Events.level_completed.emit()
		
		
	
	
	
	#if body.name == "Player":
		#body.score += 1
		#self.queue_free()
		#print(body.score)
