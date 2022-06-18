class_name Travel
extends Node2D


const WaveScene : PackedScene = preload("res://Wave.tscn")

export var debugDiamond : float = 5.0 setget set_DD

onready var boatAnchored : bool = false

# declare RNG as a member variable
# creating an explicit rng object allows more functions / cleaner syntax
# and lets you save the state of the rng for debug + save game purposes

onready var rng : RandomNumberGenerator = RandomNumberGenerator.new()

# setter function
func set_DD(new_DD):
	debugDiamond = new_DD
	$UI/DebugDia/DebugDiaLabel.text = ": "  + str(debugDiamond)


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	$UI/DebugDia/DebugDiaLabel.text = ": " + str(debugDiamond)



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


# event handler to spawn new waves in the water
func _on_WaveTimer_timeout():
	var waveInst = WaveScene.instance()
	add_child(waveInst)


# handler to give the player a periodic game event
func _on_EventTimer_timeout():
	fullPause()
	debugRandomEvent()

func debugRandomEvent():
	#choose event

	var numEvents = 2
	var thisEvent = rng.randi_range(1, numEvents)

	# build res:// string pointing to the scene for an event number
	var sceneBuild = "res://events/DebugEvent"+ str(thisEvent) +".tscn"


	#get event
	var EventScene : PackedScene = load(str(sceneBuild))
	var eventInst = EventScene.instance()
	add_child(eventInst)

func _on_event_end():
	print("_on_event_end triggered")
	fullUnpause()
