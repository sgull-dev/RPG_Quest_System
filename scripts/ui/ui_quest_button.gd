extends Button


var id_to_access : int

@onready var viewer = $"../../../QuestViewer"

func initialize_button(id):
	id_to_access = id
	text = QuestData.active_quests[id].quest_name

func select_quest():
	#name to feed viewer
	var q_name = QuestData.active_quests[id_to_access].quest_name
	#get correct length of description based on quest progress
	var q_desc = ""
	var i = 0
	while i < QuestData.active_quests[id_to_access].quest_progress:
		if i >= QuestData.active_quests[id_to_access].quest_description.size():
			break
		q_desc += QuestData.active_quests[id_to_access].quest_description[i]
		q_desc += "\n"
		i += 1
	viewer.view_quest(q_name, q_desc)

func _on_button_down():
	select_quest()
