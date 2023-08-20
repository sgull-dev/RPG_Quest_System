extends Control

signal opened_quest_menu

var menu_is_open : bool = false

func _ready():
	visible = false

func _input(event):
	if event.is_action_pressed("quest_menu"):
		if !menu_is_open:
			open_menu()
		else:
			if menu_is_open:
				close_menu()
	elif event.is_action_pressed("ui_cancel"):
		if menu_is_open:
			close_menu()

func open_menu():
	visible = true
	menu_is_open = true
	
	opened_quest_menu.emit()

func close_menu():
	visible = false
	menu_is_open = false


func _on_close_button_button_down():
	close_menu()
