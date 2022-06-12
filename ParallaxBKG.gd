extends ParallaxBackground


# Declare member variables here. Examples:
# var a = 2
export var baseScrollSpeed = 10
export var currScrollSpeed = 10

var color = {
	"nearR": 43/255,
	"nearG": 94/255,
	"nearB": 80/255,
	"mediumR": 56/255,
	"mediumG": 112/255,
	"mediumB": 90/255,
	"farR": 66/255,
	"farG": 120/255,
	"farB": 86/255
}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# manually set the background scroll speed
	scroll_base_offset += Vector2(currScrollSpeed,0) * delta
#	pass
