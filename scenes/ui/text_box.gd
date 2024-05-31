extends MarginContainer

# Instancias de nós filhos
@onready var label = $MarginContainer/Label
@onready var timer = $letter_display_timer

# Variáveis
const max_width:int = 256

var text:String = ""
var letter_index:int = 0
var letter_time:float = 0.03
var space_time:float = 0.06
var punctuation_time:float = 0.2

# Sinal para indicar que a exibição do texto foi concluída
signal finished_displaying

# Função para iniciar a exibição do texto
func display_text(text_to_display:String):
	# Armazena o texto a ser exibido
	text = text_to_display
	# Define o texto completo no label (a princípio)
	label.text = text_to_display
	
	# Aguarda o redimensionamento do container
	await resized
	# Define o tamanho mínimo customizado do container, limitando a largura máxima
	custom_minimum_size.x = min(size.x, max_width)
	
	# Se o tamanho exceder a largura máxima, ajusta a quebra de linha
	if size.x > max_width:
		label.autowrap_mode = TextServer.AUTOWRAP_WORD
		# Aguarda o redimensionamento para ajustar largura e altura
		await resized # para o x
		await resized # para o y
		custom_minimum_size.y = size.y
	
	# Ajusta a posição global do container para centralizá-lo
	global_position.x -= size.x / 2
	global_position.y -= size.y + 24
	
	# Limpa o texto do label para começar a exibir letra por letra
	label.text = ""
	_display_letter()

# Função para exibir cada letra do texto gradualmente
func _display_letter():
	# Adiciona a próxima letra ao texto exibido
	label.text += text[letter_index]
	
	# Incrementa o índice da letra
	letter_index += 1
	# Verifica se todas as letras foram exibidas
	if letter_index >= text.length():
		# Emite o sinal indicando que a exibição foi concluída
		emit_signal("finished_displaying")
		return
	
	# Ajusta o tempo do temporizador baseado no tipo de caractere
	match text[letter_index]:
		"!", ".", ",", "?":
			timer.start(punctuation_time) # Tempo maior para pontuações
		" ":
			timer.start(space_time) # Tempo intermediário para espaços
		_:
			timer.start(letter_time) # Tempo padrão para letras

# Função chamada quando o temporizador expira
func _on_letter_display_timer_timeout():
	_display_letter() # Chama a função para exibir a próxima letra
