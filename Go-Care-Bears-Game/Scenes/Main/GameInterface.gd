extends HBoxContainer

var pauseMenu = preload("res://Scenes/Main/PauseMenu.tscn")

onready var back = $Back
onready var pause = $Pause
onready var forward = $Forward

export(NodePath) var UIPath

var UI

func _ready():
	UI = get_node(UIPath)
	
	pause.connect("pressed", self, "_pause_pressed")

func _pause_pressed():
	var p = pauseMenu.instance()
	UI.add_child(p)
	
	clearFocus()

func clearFocus():
	for i in [back, pause, forward]:
		i.release_focus()
