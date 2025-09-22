extends Area2D

func _on_body_entered(body):
	if body.is_in_group("object"):
		var playerNode = %Ground;
		if(playerNode):
			var playerPosition = playerNode.get_index();
			get_parent().move_child(body, playerPosition + 1);
