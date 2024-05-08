extends Node

var goToLevel
var weapons = [null,null,null,null,null]
var totalSubmachineGunAmmo = 175
var currentSubmachineGunAmmo = 35
var totalPistolAmmo = 40
var currentPistolAmmo = 10
var totalRifleAmmo = 90
var currentRifleAmmo = 30

#player score
var score = 0
var lastLevelFinished

#level 1 score stuff
var dates1 = []
var highScoresStr1 = []
var highScoresInt1 = []

#level 2 score stuff
var dates2 = []
var highScoresStr2 = []
var highScoresInt2 = []

#level 3 score stuff
var dates3 = []
var highScoresStr3 = []
var highScoresInt3 = []

#issaugo taskus i high score masyva jeigu surinktu tasku kiekis diesnis nei didziausias high score
func save_level1_score():
	if(highScoresInt1.size() == 0):
		var date = Time.get_date_string_from_system()
		date = date.replace("-", "/")
		dates1.append(date)
		highScoresInt1.append(score)
		highScoresStr1.append(str(score))
	elif(score > highScoresInt1.max()):
		var date = Time.get_date_string_from_system()
		date = date.replace("-", "/")
		dates1.append(date)
		highScoresInt1.append(score)
		highScoresStr1.append(str(score))
	lastLevelFinished = 1
	score = 0

func save_level2_score():
	if(highScoresInt2.size() == 0):
		var date = Time.get_date_string_from_system()
		date = date.replace("-", "/")
		dates2.append(date)
		highScoresInt2.append(score)
		highScoresStr2.append(str(score))
	elif(score > highScoresInt2.max()):
		var date = Time.get_date_string_from_system()
		date = date.replace("-", "/")
		dates2.append(date)
		highScoresInt2.append(score)
		highScoresStr2.append(str(score))
	lastLevelFinished = 2
	score = 0

func save_level3_score():
	if(highScoresInt3.size() == 0):
		var date = Time.get_date_string_from_system()
		date = date.replace("-", "/")
		dates3.append(date)
		highScoresInt3.append(score)
		highScoresStr3.append(str(score))
	elif(score > highScoresInt3.max()):
		var date = Time.get_date_string_from_system()
		date = date.replace("-", "/")
		dates3.append(date)
		highScoresInt3.append(score)
		highScoresStr3.append(str(score))
	lastLevelFinished = 3
	score = 0


