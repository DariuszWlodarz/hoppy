extends Area2D

func _on_SpikeTop_body_entered(body):
	print('1')
	if body.has_method("hurt"):
		print('2')
		body.hurt()
		
