extends VBoxContainer

@onready var quest_menu = $"../QuestMenu"

func _on_open_menu_button_button_down():
	quest_menu.open_menu()

func _on_add_quest_button_button_down():
	QuestData.activate_quest(1)


func _on_progress_quest_button_button_down():
	QuestData.progress_quest(1)
