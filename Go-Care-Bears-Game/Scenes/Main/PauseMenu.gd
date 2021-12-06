extends Control


onready var options = $Panel/Center/Options

onready var saveGame = options.get_node("CenterSave/Save")
onready var loadGame = options.get_node("CenterLoad/Load")

onready var fullscreen = options.get_node("CenterFullscreen/Fullscreen")
onready var resolution = options.get_node("CenterRes/ResolutionOption")
onready var moreSettings = options.get_node("CenterSettings/MoreSettings")

onready var cancel = options.get_node("CenterCancel/Cancel")
onready var menu = options.get_node("CenterMenu/Menu")
onready var quit = options.get_node("CenterQuit/Quit")

var quitPanel = preload("res://Scenes/Main/Quit.tscn")

var res = [
	Vector2(960, 540),
	Vector2(1920, 1080),
	Vector2(1366, 768), 
	Vector2(1536, 864), 
	Vector2(1440, 900), 
	Vector2(1280, 720), 
	Vector2(1600, 900)
]

var buttons = [
	saveGame,
	loadGame,
	fullscreen,
	resolution,
	moreSettings,
	cancel,
	menu,
	quit
]

func _ready():
	clear_focus()
	
	saveGame.connect("pressed", self, "_save_pressed")
	loadGame.connect("pressed", self, "_load_pressed")
	
	for i in range(len(res)):
		resolution.get_popup().add_item(str(res[i].x) + "x" + str(res[i].y))
	
	fullscreen.connect("pressed", self, "_fullscreen_pressed")
	resolution.get_popup().connect("id_pressed", self, "_res_id_pressed")
	moreSettings.connect("pressed", self, "_more_settings_pressed")
	
	cancel.connect("pressed", self, "_cancel_pressed")
	menu.connect("pressed", self, "_menu_pressed")
	quit.connect("pressed", self, "_quit_pressed")

func clear_focus():
	#for _i in buttons:
	#	_i.release_focus()
	pass

func _save_pressed():
	pass

func _load_pressed():
	pass

func _fullscreen_pressed():
	OS.set_window_fullscreen(!OS.window_fullscreen)

func _res_id_pressed():
	pass

func _more_settings_pressed():
	pass

func _cancel_pressed():
	queue_free()

func _menu_pressed():
	pass

func _quit_pressed():
	var _q = quitPanel.instance()
	add_child(_q)
	clear_focus()
