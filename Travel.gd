extends Node2D


# Declare member variables here. Examples:
var waveSpawnsAt = 120
var waveSpawn = 0
var waveScene = load("res://Wave.tscn")
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#spawn waves
	waveSpawn += 1
	if waveSpawn >= waveSpawnsAt:
		waveSpawn = 0
		var waveInst = waveScene.instance()
		add_child(waveInst)
		
		
#	pass
