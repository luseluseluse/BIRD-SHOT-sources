extends ColorRect

signal flashing

@export var pathToNewScene : String
## True = White, False = Black
@export var whiteFlashOrBlackFlash : bool = true 
@export var stopTitleIfPlaying : AudioStreamPlayer

func _ready() -> void:
    $TransitionAnim.connect("animation_finished", flashFinished)

func flash() -> void:
    flashing.emit()
    if not stopTitleIfPlaying == null:
        stopTitleIfPlaying.stop()

    if whiteFlashOrBlackFlash:
        $TransitionAnim.play("Flash")
    else:
        $TransitionAnim.play("FlashBlack")

func flashFinished(animName : String):
    if animName == "Flash" or animName == "FlashBlack":
        get_tree().change_scene_to_file(pathToNewScene)