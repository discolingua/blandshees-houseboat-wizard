extends ParallaxBackground


export var baseScrollSpeed = 10
export var currScrollSpeed = 10

const color = {
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


func _process(delta):
	# manually set the background scroll speed
	scroll_base_offset += Vector2(currScrollSpeed,0) * delta

