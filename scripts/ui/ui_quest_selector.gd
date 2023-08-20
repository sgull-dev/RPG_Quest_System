extends Panel

var _quest_button = preload("res://scenes/ui/quest_button.tscn")

@onready var parent = $".."
@onready var container = $ActiveCont

func _ready():
	parent.opened_quest_menu.connect(setup_quest_buttons)

func setup_quest_buttons():
	#get rid of old buttons
	for button in container.get_children():
		button.queue_free()
	#get new buttons
	for quest_id in QuestData.active_quests:
		var quest_button = _quest_button.instantiate()
		quest_button.initialize_button(quest_id)
		container.add_child(quest_button)
	
	#wait one frame so older choice buttons have been flushed away
	await get_tree().process_frame
	#TO-DO: here I should set grab focus and set focus neighbors
	print(container.get_child_count())
	if container.get_child_count() > 0:
		container.get_child(0).grab_focus()
