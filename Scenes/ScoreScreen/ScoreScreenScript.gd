extends Node

var dateLabels = []
var scoreLabels = []
var labelCount = 5
#var dates = ["1", "2", "3"]
#var scores = ["100", "200", "300"]
#var offset = 0

func _ready():
	dateLabels.append($MarginContainer/HBoxContainer/VBoxContainer/DateLabel1);
	dateLabels.append($MarginContainer/HBoxContainer/VBoxContainer/DateLabel2);
	dateLabels.append($MarginContainer/HBoxContainer/VBoxContainer/DateLabel3);
	dateLabels.append($MarginContainer/HBoxContainer/VBoxContainer/DateLabel4);
	dateLabels.append($MarginContainer/HBoxContainer/VBoxContainer/DateLabel5);
	scoreLabels.append($MarginContainer2/HBoxContainer/VBoxContainer/ScoreLabel1)
	scoreLabels.append($MarginContainer2/HBoxContainer/VBoxContainer/ScoreLabel2)
	scoreLabels.append($MarginContainer2/HBoxContainer/VBoxContainer/ScoreLabel3)
	scoreLabels.append($MarginContainer2/HBoxContainer/VBoxContainer/ScoreLabel4)
	scoreLabels.append($MarginContainer2/HBoxContainer/VBoxContainer/ScoreLabel5)
	update_info(Global.lastLevelFinished)


func update_info(level):
	print(level)
	if(level == 1):
		load_level1_scores()
	elif(level == 2):
		load_level2_scores()
	elif(level == 3):
		load_level3_scores()

func load_level1_scores():
	for i in range(labelCount):
		if(i < Global.dates1.size()):
			dateLabels[i].text = Global.dates1[i]
			scoreLabels[i].text = Global.highScoresStr1[i]
		else:
			dateLabels[i].text = " "
			scoreLabels[i].text = " "

func load_level2_scores():
	for i in range(labelCount):
		if(i < Global.dates2.size()):
			dateLabels[i].text = Global.dates2[i]
			scoreLabels[i].text = Global.highScoresStr2[i]
		else:
			dateLabels[i].text = " "
			scoreLabels[i].text = " "

func load_level3_scores():
	for i in range(labelCount):
		if(i < Global.dates3.size()):
			dateLabels[i].text = Global.dates3[i]
			scoreLabels[i].text = Global.highScoresStr3[i]
		else:
			dateLabels[i].text = " "
			scoreLabels[i].text = " "

#	for i in range(5):
#		if(i+offset < Global.dates.size()):
#			dateLabels[i].text = Global.dates[i+offset]
#			scoreLabels[i].text = Global.highScoresStr[i+offset]
#		else:
#			dateLabels[i].text = " "
#			scoreLabels[i].text = " "
