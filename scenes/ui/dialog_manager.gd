extends Node

# Carrega a cena do text box (caixa de diálogo) que será usada para mostrar as linhas do diálogo.
@onready var text_box_scene = preload("res://scenes/ui/dialog.tscn")

# Array que armazenará as linhas do diálogo.
var dialog_lines: Array[String] = []

# Índice da linha atual do diálogo.
var current_line_index = 0

# Referência para a instância da caixa de texto.
var text_box

# Posição da caixa de texto na tela.
var text_box_position: Vector2

# Flag que indica se o diálogo está ativo.
var is_dialog_active:bool = false

# Flag que indica se é possível avançar para a próxima linha do diálogo.
var can_advance_line:bool = false

# Função para iniciar o diálogo.
func start_dialog(position: Vector2, lines: Array[String]):
	if is_dialog_active:
		# Se um diálogo já está ativo, não faz nada.
		return
	
	# Armazena as linhas do diálogo e a posição da caixa de texto.
	dialog_lines = lines
	text_box_position = position
	
	# Mostra a caixa de texto com a primeira linha do diálogo.
	_show_text_box()
	
	# Marca que o diálogo está ativo.
	is_dialog_active = true

# Função para exibir a caixa de texto.
func _show_text_box():
	# Cria uma instância da cena da caixa de texto.
	text_box = text_box_scene.instantiate()
	
	# Conecta o sinal que indica que a caixa de texto terminou de exibir a linha atual.
	text_box.finished_displaying.connect(_on_text_box_finished_displaying)
	
	# Adiciona a caixa de texto à árvore de cena.
	get_tree().root.add_child(text_box)
	
	# Define a posição da caixa de texto.
	text_box.global_position = text_box_position
	
	# Exibe a linha atual do diálogo na caixa de texto.
	text_box.display_text(dialog_lines[current_line_index])
	
	# Marca que não é possível avançar para a próxima linha até que a linha atual seja exibida completamente.
	can_advance_line = false

# Função chamada quando a caixa de texto termina de exibir a linha atual.
func _on_text_box_finished_displaying():
	# Marca que é possível avançar para a próxima linha do diálogo.
	can_advance_line = true

# Função que trata a entrada não manipulada.
func _unhandled_input(event):
	if (
		event.is_action_pressed("ui_accept") &&  # Verifica se a ação "interact" foi pressionada.
		is_dialog_active &&  # Verifica se o diálogo está ativo.
		can_advance_line  # Verifica se é possível avançar para a próxima linha.
	):
		# Remove a caixa de texto atual.
		text_box.queue_free()
		
		# Avança para a próxima linha do diálogo.
		current_line_index += 1
		
		if current_line_index >= dialog_lines.size():
			# Se todas as linhas foram exibidas, marca que o diálogo não está mais ativo e reseta o índice.
			is_dialog_active = false
			current_line_index = 0
			return
		
		# Mostra a próxima linha do diálogo.
		_show_text_box()
