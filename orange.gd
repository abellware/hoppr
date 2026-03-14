extends Area2D

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


#func _on_area_entered(area: Area2D):
	#queue_free()
