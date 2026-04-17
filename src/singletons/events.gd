extends Node


signal scene_changed(path: String)

func emit_scene_changed(scene_path: String):
	scene_changed.emit(scene_path)