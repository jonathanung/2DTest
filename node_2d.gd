extends Node2D

# Reference to the PopupPanel node
@onready var popup_panel = $PopupPanel
@onready var timer = $Timer

# Reference to the Label nodes
@onready var label_left = $PopupPanel/VBoxContainer/LabelLeft
@onready var label_right = $PopupPanel/VBoxContainer/LabelRight
@onready var label_jump = $PopupPanel/VBoxContainer/LabelJump

func _ready():
	# Set text for the Label nodes
	label_left.text = "Press ← to move left"
	label_right.text = "Press → to move right"
	label_jump.text = "Press Space to jump"

	# Center the PopupPanel
	var popup_size = popup_panel.get_size()
	popup_panel.set_position(Vector2((get_viewport().get_visible_rect().size.x - popup_size.x) / 2, 
									 (get_viewport().get_visible_rect().size.y - popup_size.y) / 2))

	# Show the PopupPanel and start the timer
	popup_panel.show()
	timer.start()

	# Connect the timer's timeout signal to hide the PopupPanel
	timer.connect("timeout", Callable(self, "_on_Timer_timeout"))

func _on_Timer_timeout():
	popup_panel.hide()
