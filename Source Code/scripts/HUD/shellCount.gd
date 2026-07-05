extends Node

var gunBullets : int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	match gunBullets:
		0:
			$ShowShellAnim.play("ZeroShells")
		1:
			$ShowShellAnim.play("OneShell")
		2:
			$ShowShellAnim.play("TwoShells")
		3:
			$ShowShellAnim.play("ThreeShells")
		4:
			$ShowShellAnim.play("FourShells")
		5:
			$ShowShellAnim.play("FiveShells")
		_:
			push_error("HEY FUCK UP! YOU FUCKED UP!")
