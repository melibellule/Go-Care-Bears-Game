extends ColorRect

onready var exit = $Panel/VBox/CenterQuit/Quit
onready var cancel = $Panel/VBox/CenterCancel/Cancel

func _ready():
	
	exit.connect("pressed", self, "_exit_pressed")
	cancel.connect("pressed", self, "_cancel_pressed")

func _exit_pressed():
	get_tree().quit()

func _cancel_pressed():
	queue_free()
