extends TextureRect

@export var menu_interface: MenuInterfaceComponent
@export var buttons: Control

func _ready() -> void:
    menu_interface.remote_moved.connect(_on_position_moved)
    visible = false


func _on_position_moved(test):
    visible = true
    position = test

func on_click(coords):
    for button: Button in buttons.get_children():
        if button.get_global_rect().has_point(coords):
            button.emit_signal("pressed")
            return
