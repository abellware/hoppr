extends Area2D

#func area_shape_entered():
	

#var goal_entered = false
#
#func _on_goal_area_area_entered(area):
	#if area.is_in_group("apple"):
		#goal_entered = true


func _on_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://level_two.tscn")
