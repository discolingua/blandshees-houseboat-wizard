extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var root = get_node("/root/Travel")
var bet
var bellyWin
var landing

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("tree_exiting", root, "_on_event_end")
	
	if randi()%2 == 0:
		bellyWin = false
		landing = "back"
	else:
		bellyWin = true
		landing = "belly"
	
	randomize()
	
	#cant bet if no diamonds
	if root.debugDiamond == 0:
		$Buttons/BackButton.visible = false
		$Buttons/BellyButton.visible = false
	else:
		# random int between 1 and #debugs
		bet = randi() % root.debugDiamond +1
		print(str(bellyWin) + ", " + str(bet))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func betWin():
	$mainText.text = "\"" + str(bet) + "!\" the seal yells, right before he lands on his "
	$mainText.text += landing + ". \"Dang, nice call! Here's your gems.\""
	root.debugDiamond += bet
	$Buttons/EndButton.text = "Hell yeah"


func betLose():
	$mainText.text = "\"" + str(bet) + "!\" the seal yells, right before he lands on his "
	$mainText.text += landing + ". \"Tough luck boss, I'll be taking those.\""
	root.debugDiamond -= bet
	$Buttons/EndButton.text = "Aw nuts."


func _on_EndButton_pressed():
	queue_free()


func _on_BellyButton_pressed():
	$Buttons/BackButton.visible = false
	$Buttons/BellyButton.visible = false
	$Buttons/DeclineButton.visible = false
	$Buttons/EndButton.visible = true
	if bellyWin:
		betLose()
	else:
		betWin()


func _on_BackButton_pressed():
	$Buttons/BackButton.visible = false
	$Buttons/BellyButton.visible = false
	$Buttons/DeclineButton.visible = false
	$Buttons/EndButton.visible = true
	if !bellyWin:
		betLose()
	else:
		betWin()


func _on_DeclineButton_pressed():
	$Buttons/BackButton.visible = false
	$Buttons/BellyButton.visible = false
	$Buttons/DeclineButton.visible = false
	$Buttons/EndButton.visible = true
	$mainText.text = "The seal crashes into the water with a splash. \"You didn't say anything!\" he says sadly. \"You're no fun at all.\" He dejectedly dives beneath the waves."
	$Buttons/EndButton.text = "Sorry?"
	pass # Replace with function body.
