extends Area2D




func _on_body_entered(body):
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
