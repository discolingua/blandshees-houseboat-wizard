extends Control


onready var root = get_node("/root/Travel")

# Called when the node enters the scene tree for the first time.
func _ready():
	var _error_code = self.connect("tree_exiting", root, "_on_event_end")
	if _error_code != 0:
		print("Something went wrong setting up the debug event.")


func _on_YesButton_pressed():
	$mainText.text = "The bird lifts its top hat, and pulls out a diamond. It nods, and flies away."
	$Buttons/YesButton.visible = false
	$Buttons/NoButton.visible = false
	$Buttons/EndButton.visible = true
	$Buttons/EndButton.text = "Thank you, friend"
	#+1 debugDiamond
	root.debugDiamond += 1


func _on_NoButton_pressed():
	$mainText.text = "The bird shrugs its shoulders and flies off."
	$Buttons/YesButton.visible = false
	$Buttons/NoButton.visible = false
	$Buttons/EndButton.visible = true
	$Buttons/EndButton.text = "OK Bye"


func _on_EndButton_pressed():
	queue_free()
