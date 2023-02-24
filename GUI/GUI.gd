extends CanvasLayer
	
func update_GUI(lifesLeft, coins):
	$TextureRect/HBoxContainer/LifeCount.text = String(lifesLeft)
	$TextureRect/HBoxContainer/CoinCount.text = str(coins)

