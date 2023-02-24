extends Node2D

var lives = 3
var coins = 0
var target_number_of_coins = 3

func _ready():
	add_to_group("Gamestate")
	update_gui()

func hurt():
	lives -= 1
	$Player.hurt()
	update_gui()
	if lives <0:
		end_game()

func update_gui():
	get_tree().call_group("GUI", "update_GUI", lives, coins)
	
func coin_up():
	coins += 1
	if coins % target_number_of_coins == 0:
		life_up()
	update_gui()

func life_up():
		lives += 1
		update_gui()

func end_game():
	get_tree().change_scene("res://levels/GameOver.tscn")
	
func win_game():
	get_tree().change_scene("res://levels/Victory.tscn")
