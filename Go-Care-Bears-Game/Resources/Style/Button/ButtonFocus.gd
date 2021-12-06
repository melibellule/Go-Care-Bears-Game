extends Button

func _ready():
	connect("mouse_entered", self, "_get_focus")

func _get_focus():
	grab_focus()
