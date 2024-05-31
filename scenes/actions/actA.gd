extends Node

# variaveis
var exist:bool = false
var is_interacting:bool = false
var interact_cooldown:float = 0

# Inputs
func _process(delta:float) -> void:
	# atribuindo o cooldown
	interact_cooldown-=delta
	if interact_cooldown <= 0:
		is_interacting = false
	
	# ao pressionar
	if !is_interacting:
		if Input.is_action_just_pressed("interact1"):
			interact()
		
		if  Input.is_anything_pressed():
			cooldown()

#funcoes
func interact() -> void:
	print("interagiu")
	queue_free()

func cooldown() -> void:
	is_interacting = true
	interact_cooldown = 0.6
