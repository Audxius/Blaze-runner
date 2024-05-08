extends Node

var dateLabels = []
var timeLabels = []
var scoreLabels = []
var labelCount = 5
#var dates = ["1", "2", "3"]
#var scores = ["100", "200", "300"]
#var offset = 0

func _ready():
	dateLabels.append($MarginContainerTable/HBoxContainer/VBoxContainerDates/DateLabel1);
	dateLabels.append($MarginContainerTable/HBoxContainer/VBoxContainerDates/DateLabel2);
	dateLabels.append($MarginContainerTable/HBoxContainer/VBoxContainerDates/DateLabel3);
	dateLabels.append($MarginContainerTable/HBoxContainer/VBoxContainerDates/DateLabel4);
	dateLabels.append($MarginContainerTable/HBoxContainer/VBoxContainerDates/DateLabel5);
	
	timeLabels.append($MarginContainerTable/HBoxContainer/VBoxContainer2Time/TimeLabel1);
	timeLabels.append($MarginContainerTable/HBoxContainer/VBoxContainer2Time/TimeLabel2);
	timeLabels.append($MarginContainerTable/HBoxContainer/VBoxContainer2Time/TimeLabel3);
	timeLabels.append($MarginContainerTable/HBoxContainer/VBoxContainer2Time/TimeLabel4);
	timeLabels.append($MarginContainerTable/HBoxContainer/VBoxContainer2Time/TimeLabel5);
	
	scoreLabels.append($MarginContainerTable/HBoxContainer/VBoxContainerScore/HBoxContainer1/ScoreLabel1)
	scoreLabels.append($MarginContainerTable/HBoxContainer/VBoxContainerScore/HBoxContainer2/ScoreLabel2)
	scoreLabels.append($MarginContainerTable/HBoxContainer/VBoxContainerScore/HBoxContainer3/ScoreLabel3)
	scoreLabels.append($MarginContainerTable/HBoxContainer/VBoxContainerScore/HBoxContainer4/ScoreLabel4)
	scoreLabels.append($MarginContainerTable/HBoxContainer/VBoxContainerScore/HBoxContainer5/ScoreLabel5)
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
			timeLabels[i].text = Global.time1[i]
			scoreLabels[i].text = Global.highScoresStr1[i]
		else:
			dateLabels[i].text = " "
			timeLabels[i].text = " "
			scoreLabels[i].text = " "

func load_level2_scores():
	for i in range(labelCount):
		if(i < Global.dates2.size()):
			dateLabels[i].text = Global.dates2[i]
			timeLabels[i].text = Global.time2[i]
			scoreLabels[i].text = Global.highScoresStr2[i]
		else:
			dateLabels[i].text = " "
			timeLabels[i].text = " "
			scoreLabels[i].text = " "

func load_level3_scores():
	for i in range(labelCount):
		if(i < Global.dates3.size()):
			dateLabels[i].text = Global.dates3[i]
			timeLabels[i].text = Global.time3[i]
			scoreLabels[i].text = Global.highScoresStr3[i]
		else:
			dateLabels[i].text = " "
			timeLabels[i].text = " "
			scoreLabels[i].text = " "

#	for i in range(5):
#		if(i+offset < Global.dates.size()):
#			dateLabels[i].text = Global.dates[i+offset]
#			scoreLabels[i].text = Global.highScoresStr[i+offset]
#		else:
#			dateLabels[i].text = " "
#			scoreLabels[i].text = " "
