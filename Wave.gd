extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var recede = false
var x = 0
var alpha = 0
export var waveSpeed = .2

# Called when the node enters the scene tree for the first time.
func _ready():
	var random = RandomNumberGenerator.new()
	random.randomize()

	modulate.a = alpha
	position.x = random.randi_range(-10,130)
	position.y = random.randi_range(85,120)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#every X frames, alpha increases by 1. when it hits 100, it recedes back down to 0 and dies
	x = x+1
	if x == 2:
		x = 0
		if recede:
			alpha = alpha-.01
		else:
			alpha = alpha+.01
	
	modulate.a = alpha
	position.x = position.x + waveSpeed
	
	if alpha >= 1:
		recede = true
	
	if (alpha <= 0) && recede:
		queue_free()
		
		
#	pass
