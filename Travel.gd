extends Node2D


# Declare member variables here. Examples:
const WaveScene : PackedScene = preload("res://Wave.tscn")
var boatAnchored = false
export var debugDiamond = 5 setget set_DD

func set_DD(new_DD):
	debugDiamond = new_DD
	$UI/DebugDia/DebugDiaLabel.text = ": "  + str(debugDiamond)


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$UI/DebugDia/DebugDiaLabel.text = ": " + str(debugDiamond)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass



func _on_Anchor_pressed():
	if boatAnchored:
		#$EventTimer.set_paused(false)
		$EventTimer.paused = false 
		boatAnchored = false
		$TravelParallax.currScrollSpeed = $TravelParallax.baseScrollSpeed
		print("unanchor")
	else: 
		boatAnchored = true
		$EventTimer.paused = true
		$TravelParallax.currScrollSpeed = 0
		print("anchor")

func fullPause():
	$EventTimer.paused = true
	$WaveTimer.paused = true
	$TravelParallax.currScrollSpeed = 0
	
func fullUnpause():
	$EventTimer.paused = false
	$WaveTimer.paused = false
	$TravelParallax.currScrollSpeed = $TravelParallax.baseScrollSpeed

func _on_WaveTimer_timeout():
	var waveInst = WaveScene.instance()
	add_child(waveInst)

func _on_EventTimer_timeout():
	fullPause()
	debugRandomEvent()

func debugRandomEvent():
	var EventScene : PackedScene = load("res://events/DebugEvent1.tscn")
	var eventInst = EventScene.instance()
	var root = get_tree().get_root()
	root.add_child(eventInst)

func _on_event_end():
	print("_on_event_end triggered")
	fullUnpause()
