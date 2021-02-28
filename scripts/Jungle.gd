extends Node2D

func _process(_delta):

	debug_info()

func debug_info():

	$UILayer/DebugUI.show()
	$UILayer/DebugUI/DebugPanel/Label.text = "Tires: " + str($WorldLayer/Wheeligator.tires)
