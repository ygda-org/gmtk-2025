extends AnimationPlayer


func restart_game():
	GameState.restart_game() # I needed this because apparently AnimationPlayers can't call from singletons?
