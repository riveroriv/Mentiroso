extends CanvasLayer

var colors = [
	Color('#12263A'),
	Color('#06BCC1'),
	Color('#FEC601'),
	Color('#FF4000')
]

func _ready():
	$ColorRect.color = colors.pick_random()
	
func change(index: int):
	$ColorRect.color = colors[index]

func _input(event):
	if event.is_action_pressed("ui_color"):
		$ColorRect.color = colors.pick_random()
		
