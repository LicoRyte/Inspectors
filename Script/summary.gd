extends Node2D

@onready var label: Label = $Label

func show_sequence():
	# Step 1: Show "You Win!"
	label.text = "You Win!"
	label.show()
	await get_tree().create_timer(2.0).timeout
	
	# Step 2: Showr coins
	label.text = ""
	await get_tree().create_timer(2.0).timeout
	
	# Step 3: Maybe another message
	label.text = "New Record!"
	await get_tree().create_timer(2.0).timeout
	
	# Step 4: Hide
	label.hide()
