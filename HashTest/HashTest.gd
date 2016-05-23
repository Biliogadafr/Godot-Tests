
extends Node2D

var str_by_int = {}
var str_by_str = {}

var iterations = 500000
var str_postfix = "something_to_make_it_longer"

func _ready():
	print("Start test... Time: ", OS.get_ticks_msec())
	for i in range(iterations):
		str_by_int[i] = str(i)
		
	for i in range(iterations):
		str_by_str[str(i)+str_postfix] = str(i)
	
	print("Dictionaries ready. Time:  ", OS.get_ticks_msec())
	
	iterate_pure()	
	iterate()	
	iterate_with_check()
	
	iterate_pure_str()	
	iterate_str()	
	iterate_with_check_str()
	
	pass

func iterate_pure():
	var start = OS.get_ticks_msec()
	for i in range(iterations):
		var something = str_by_int[i]
	var end = OS.get_ticks_msec()
	print("Int key. Only access: ", (end - start))
	
#some empty check to make this check consume time
func iterate():
	var start = OS.get_ticks_msec()
	for i in range(iterations):
		if(true):
			var something = str_by_int[i]
	var end = OS.get_ticks_msec()
	print("Int key. Access with dummy check: ", (end - start))
			
func iterate_with_check():
	var start = OS.get_ticks_msec()
	for i in range(iterations):
		if(str_by_int.has(i)):
			var something = str_by_int[i]
	var end = OS.get_ticks_msec()
	print("Int key. Access with has() check: ", (end - start))
	
	
#the same for string keys


func iterate_pure_str():
	var start = OS.get_ticks_msec()
	for i in range(iterations):
		var key = str(i) + str_postfix
		var something = str_by_str[key]
	var end = OS.get_ticks_msec()
	print("String key. Only access: ", (end - start))
	
func iterate_str():
	var start = OS.get_ticks_msec()
	for i in range(iterations):
		var key = str(i) + str_postfix
		if(true):
			var something = str_by_str[key]
	var end = OS.get_ticks_msec()
	print("String key. Access with dummy check: ", (end - start))
			
func iterate_with_check_str():
	var start = OS.get_ticks_msec()
	for i in range(iterations):
		var key = str(i) + str_postfix
		if(str_by_str.has(key)):
			var something = str_by_str[key]
	var end = OS.get_ticks_msec()
	print("String key. Access with has() check: ", (end - start))