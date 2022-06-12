extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var root = get_node("../Travel")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("tree_exiting", root, "_on_event_end")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_YesButton_pressed():
	$mainText.text = "The bird lifts its top hat, and pulls out a diamond. It nods, and flies away."
	$YesButton.visible = false
	$NoButton.visible = false
	$EndButton.visible = true
	$EndButton.text = "Thank you, friend"
	#+1 debugDiamond	


func _on_NoButton_pressed():
	$mainText.text = "The bird shrugs its shoulders and flies off."
	$YesButton.visible = false
	$NoButton.visible = false
	$EndButton.visible = true
	$EndButton.text = "OK Bye"


func _on_EndButton_pressed():
	queue_free()
