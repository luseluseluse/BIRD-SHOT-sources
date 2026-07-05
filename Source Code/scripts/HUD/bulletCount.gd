extends Node

var gunBullets : int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	match gunBullets:
		0:
			$BulletShowCountAnim.play("ZeroBullets")
		1:
			$BulletShowCountAnim.play("OneBullet")
		2:
			$BulletShowCountAnim.play("TwoBullets")
		3:
			$BulletShowCountAnim.play("ThreeBullets")
		4:
			$BulletShowCountAnim.play("FourBullets")
		5:
			$BulletShowCountAnim.play("FiveBullets")
		6:
			$BulletShowCountAnim.play("SixBullets")
		_:
			push_error("HEY FUCK UP! YOU FUCKED UP!")
