extends Node

# Declarar el temporizador y la etiqueta
var timer : Timer
var label : Label
var tiempo_entero : int

func _ready():
	# Inicializar el temporizador y la etiqueta
	timer = $Timer # Asegúrate de que el nombre sea correcto
	label = $Label # Asegúrate de que el nombre sea correcto
	tiempo_entero = 16  # Establece el tiempo inicial en segundos

	# Crear un objeto Callable para conectar la señal
	var timer_callback = Callable(self, "_on_Timer_timeout")

	# Conectar la señal "timeout" del temporizador al objeto Callable
	timer.connect("timeout", timer_callback)

	# Configurar el temporizador para que se repita y tenga una duración de 1 segundo
	timer.wait_time = 1.0
	timer.one_shot = false

	# Iniciar el temporizador
	timer.start()

func _on_Timer_timeout():
	if tiempo_entero > 0:
		# Disminuir el tiempo en 1 segundo y actualizar la etiqueta
		tiempo_entero -= 1
		label.text = str(tiempo_entero)
	else:
		# Esto se ejecutará cuando el temporizador llegue a cero
		print("¡Tiempo agotado!")
