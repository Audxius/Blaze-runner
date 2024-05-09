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
var startTime
var labelCount = 5
var score = 0
var lastLevelFinished

#level 1 score stuff
var dates1 = []
var time1 = []
var highScoresStr1 = []
var highScoresInt1 = []

#level 2 score stuff
var dates2 = []
var time2 = []
var highScoresStr2 = []
var highScoresInt2 = []

#level 3 score stuff
var dates3 = []
var time3 = []
var highScoresStr3 = []
var highScoresInt3 = []

func _ready():
	load_data_from_disk()
	#pass

#issaugo taskus i high score masyva jeigu surinktu tasku kiekis diesnis nei didziausias high score
func save_level1_score():
	if(highScoresInt1.size() == 0):
		#var time = Time.get_time_string_from_system()
		#time = time.left(5)
		var date = Time.get_date_string_from_system()
		var time = calculate_time_elapsed()
		print(time)
		date = date.replace("-", "/")
		dates1.append(date)
		time1.append(time)
		highScoresInt1.append(score)
		highScoresStr1.append(str(score))
	elif(score > highScoresInt1.max()):
		var date = Time.get_date_string_from_system()
		var time = calculate_time_elapsed()
		print(time)
		date = date.replace("-", "/")
		dates1.append(date)
		time1.append(time)
		highScoresInt1.append(score)
		highScoresStr1.append(str(score))
	save_data_to_disk()
	lastLevelFinished = 1
	score = 0

func save_level2_score():
	if(highScoresInt2.size() == 0):
		var date = Time.get_date_string_from_system()
		var time = Time.get_time_string_from_system()
		date = date.replace("-", "/")
		time = time.left(5)
		dates2.append(date)
		time2.append(time)
		highScoresInt2.append(score)
		highScoresStr2.append(str(score))
	elif(score > highScoresInt2.max()):
		var date = Time.get_date_string_from_system()
		var time = Time.get_time_string_from_system()
		date = date.replace("-", "/")
		time = time.left(5)
		dates2.append(date)
		time2.append(time)
		highScoresInt2.append(score)
		highScoresStr2.append(str(score))
	save_data_to_disk()
	lastLevelFinished = 2
	score = 0

func save_level3_score():
	if(highScoresInt3.size() == 0):
		var date = Time.get_date_string_from_system()
		var time = Time.get_time_string_from_system()
		date = date.replace("-", "/")
		time = time.left(5)
		dates3.append(date)
		time3.append(time)
		highScoresInt3.append(score)
		highScoresStr3.append(str(score))
	elif(score > highScoresInt3.max()):
		var date = Time.get_date_string_from_system()
		var time = Time.get_time_string_from_system()
		date = date.replace("-", "/")
		time = time.left(5)
		dates3.append(date)
		time3.append(time)
		highScoresInt3.append(score)
		highScoresStr3.append(str(score))
	save_data_to_disk()
	lastLevelFinished = 3
	score = 0

func save_data_to_disk():
	var dates1Save = JSON.stringify(dates1)
	var time1Save = JSON.stringify(time1)
	var highScoresInt1Save = JSON.stringify(highScoresInt1)
	var highScoresStr1Save = JSON.stringify(highScoresStr1)
	var dates2Save = JSON.stringify(dates2)
	var time2Save = JSON.stringify(time2)
	var highScoresInt2Save = JSON.stringify(highScoresInt2)
	var highScoresStr2Save = JSON.stringify(highScoresStr2)
	var dates3Save = JSON.stringify(dates3)
	var time3Save = JSON.stringify(time3)
	var highScoresInt3Save = JSON.stringify(highScoresInt3)
	var highScoresStr3Save = JSON.stringify(highScoresStr3)
	
	var file = FileAccess.open("user://save_file.txt", FileAccess.WRITE)
	file.store_string(dates1Save + "\n")
	file.store_string(time1Save + "\n")
	file.store_string(highScoresInt1Save + "\n")
	file.store_string(highScoresStr1Save + "\n")
	file.store_string(dates2Save + "\n")
	file.store_string(time2Save + "\n")
	file.store_string(highScoresInt2Save + "\n")
	file.store_string(highScoresStr2Save + "\n")
	file.store_string(dates3Save + "\n")
	file.store_string(time3Save + "\n")
	file.store_string(highScoresInt3Save + "\n")
	file.store_string(highScoresStr3Save)
	file.close()

func load_data_from_disk():
	if(FileAccess.file_exists("user://save_file.txt")):
		var file = FileAccess.open("user://save_file.txt", FileAccess.READ)
		
		var date1Line = file.get_line()
		var time1Line = file.get_line()
		var scoreInt1Line = file.get_line()
		var scoreStr1Line = file.get_line()
		var date2Line = file.get_line()
		var time2Line = file.get_line()
		var scoreInt2Line = file.get_line()
		var scoreStr2Line = file.get_line()
		var date3Line = file.get_line()
		var time3Line = file.get_line()
		var scoreInt3Line = file.get_line()
		var scoreStr3Line = file.get_line()
		
		dates1 = JSON.parse_string(date1Line)
		time1 = JSON.parse_string(time1Line)
		highScoresInt1 = JSON.parse_string(scoreInt1Line)
		highScoresStr1 = JSON.parse_string(scoreStr1Line)
		dates2 = JSON.parse_string(date2Line)
		time2 = JSON.parse_string(time2Line)
		highScoresInt2 = JSON.parse_string(scoreInt2Line)
		highScoresStr2 = JSON.parse_string(scoreStr2Line)
		dates3 = JSON.parse_string(date3Line)
		time3 = JSON.parse_string(time3Line)
		highScoresInt3 = JSON.parse_string(scoreInt3Line)
		highScoresStr3 = JSON.parse_string(scoreStr3Line)
		
		
		#dates1 = JSON.parse_string(date1Line)
		#highScoresInt1 = JSON.parse_string(scoreInt1Line)
		#var highScoresStr1Parsed = JSON.parse_string(scoreStr1Line)
		#for value in highScoresStr1Parsed:
		#	highScoresStr1.append(str(value))
		#file.close()
func start_clock():
	startTime = Time.get_unix_time_from_system()

func calculate_time_elapsed():
	var timeElapsedStr
	var secondsStr
	var minutesStr
	var endTime = Time.get_unix_time_from_system()
	var timeElapsed = endTime-startTime
	timeElapsed = int(timeElapsed)
	var minutes = timeElapsed/60
	var seconds = timeElapsed%60
	
	if(seconds < 10):
		secondsStr = str("0",seconds)
	else:
		secondsStr = seconds
	
	if(minutes < 10):
		minutesStr = str("0",minutes)
	else:
		minutesStr = minutes
	
	timeElapsedStr = str(minutesStr, ":", secondsStr)
	startTime = 0
	return timeElapsedStr

func reset_ammo():
	Global.totalSubmachineGunAmmo = 175
	Global.currentSubmachineGunAmmo = 35
	Global.totalPistolAmmo = 40
	Global.currentPistolAmmo = 10
	Global.totalRifleAmmo = 90
	Global.currentRifleAmmo = 30
