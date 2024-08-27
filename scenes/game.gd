extends Node2D

var player1_points = 0
var player2_points = 0
var enemy_points = 0

@onready var player1 = $Player1
@onready var player2 = $Player2
#@onready var enemy = $EnemyPaddle
@onready var ball = $Ball
@onready var p1s = $Scores_p1
@onready var p2s = $Scores_p2

func gameover():
	if(player1_points == 10 or player2_points == 10):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func reset_game_state():
	self.call_deferred("gameover")
	player1.global_position.y = 324
	player2.global_position.y = 324
	ball.global_position.y = 320
	ball.global_position.x = 580
	ball.velocity = Vector2.ZERO
	player2.velocity = Vector2.ZERO
	player1.velocity = Vector2.ZERO
	ball.start_ball()

func _on_red_goal_point_scored() -> void:
	player1_points += 1
	p2s.set_frame_and_progress(player1_points,0)
	reset_game_state()

func _on_blue_goal_point_scored() -> void:
	player2_points += 1
	p1s.set_frame_and_progress(player2_points,0)
	reset_game_state()
