extends Node2D

var inner = preload("res://HasInnerClass.gd").InnerClass.new()

func _ready():
	print(inner.hello)
	pass