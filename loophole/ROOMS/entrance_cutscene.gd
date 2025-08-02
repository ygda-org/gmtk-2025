extends AnimationPlayer


func play_entrance_intro_animation():
	play("run_to_teller")
	await animation_finished
