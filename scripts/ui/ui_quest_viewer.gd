extends Panel

@onready var name_label = $QuestNameLabel
@onready var description_label = $QuestDescriptionLabel

func _ready():
	reset_viewer()
	$"..".opened_quest_menu.connect(reset_viewer)

func reset_viewer():
	name_label.text = ""
	description_label.text = ""

func view_quest(q_name:String, desc:String):
	name_label.text = q_name
	description_label.text = desc
