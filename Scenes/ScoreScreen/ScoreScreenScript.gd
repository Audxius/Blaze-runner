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

	timeLabels.append($MarginContainerTable/HBoxContainer/VBoxContainer2Time/HBoxContainer1/TimeLabel1);
	timeLabels.append($MarginContainerTable/HBoxContainer/VBoxContainer2Time/HBoxContainer2/TimeLabel2);
	timeLabels.append($MarginContainerTable/HBoxContainer/VBoxContainer2Time/HBoxContainer3/TimeLabel3);
	timeLabels.append($MarginContainerTable/HBoxContainer/VBoxContainer2Time/HBoxContainer4/TimeLabel4);
	timeLabels.append($MarginContainerTable/HBoxContainer/VBoxContainer2Time/HBoxContainer5/TimeLabel5);
	
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
	var index = Global.dates1.size()-1
	for i in range(labelCount):
		if(i < Global.dates1.size()):
			dateLabels[i].text = Global.dates1[index]+" "
			timeLabels[i].text = Global.time1[index]+" "
			#scoreLabels[i].text = Global.highScoresStr1[index]
			if(int(Global.time1[index])<100):
				scoreLabels[i].text = str(int(Global.highScoresStr1[index])*2)+" "
			elif(int(Global.time1[index])<130):
				scoreLabels[i].text = str(int(Global.highScoresStr1[index])*1.5)+" "
			else:
				scoreLabels[i].text = str(int(Global.highScoresStr1[index])*1)+" "
		else:
			dateLabels[i].text = " "
			timeLabels[i].text = " "
			scoreLabels[i].text = " "
		index = index - 1

func load_level2_scores():
	var index = Global.dates2.size()-1
	for i in range(labelCount):
		if(i < Global.dates2.size()):
			dateLabels[i].text = Global.dates2[index]+" "
			timeLabels[i].text = Global.time2[index]+" "
			#scoreLabels[i].text = Global.highScoresStr2[index]
			if(int(Global.time2[index])<100):
				scoreLabels[i].text = str(int(Global.highScoresStr2[index])*2)+" "
			elif(int(Global.time2[index])<130):
				scoreLabels[i].text = str(int(Global.highScoresStr2[index])*1.5)+" "
			else:
				scoreLabels[i].text = str(int(Global.highScoresStr2[index])*1)+" "
		else:
			dateLabels[i].text = " "
			timeLabels[i].text = " "
			scoreLabels[i].text = " "
		index = index - 1

func load_level3_scores():
	var index = Global.dates3.size()-1
	for i in range(labelCount):
		if(i < Global.dates3.size()):
			dateLabels[i].text = Global.dates3[index]+" "
			timeLabels[i].text = Global.time3[index]+" "
			#scoreLabels[i].text = Global.highScoresStr3[index]
			if(int(Global.time3[index])<100):
				scoreLabels[i].text = str(int(Global.highScoresStr3[index])*2)+" "
			elif(int(Global.time3[index])<130):
				scoreLabels[i].text = str(int(Global.highScoresStr3[index])*1.5)+" "
			else:
				scoreLabels[i].text = str(int(Global.highScoresStr3[index])*1)+" "
		else:
			dateLabels[i].text = " "
			timeLabels[i].text = " "
			scoreLabels[i].text = " "
		index = index - 1

#	for i in range(5):
#		if(i+offset < Global.dates.size()):
#			dateLabels[i].text = Global.dates[i+offset]
#			scoreLabels[i].text = Global.highScoresStr[i+offset]
#		else:
#			dateLabels[i].text = " "
#			scoreLabels[i].text = " "
