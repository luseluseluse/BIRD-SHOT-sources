extends HBoxContainer

var gunBullets : int
var bullets : int # What is this for???

func fire():
	var shell = get_child(gunBullets-1)
	shell.get_child(0).get_node("AnimationPlayer").play("spend")

func chamber():
	var shell = get_child(gunBullets-1)
	shell.get_child(0).get_node("AnimationPlayer").play("chamber")

func reload():
	var shell = get_child(gunBullets)
	shell.get_child(0).get_node("AnimationPlayer").play("reloadStart")
