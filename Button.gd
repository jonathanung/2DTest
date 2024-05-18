extends Button

# Reference to the PopupMenu node
@onready var popup = $"/root/Node2D/PopupMenu"  # Adjust this path according to your actual node hierarchy

func _ready():
	# Debugging: Check if popup is null
	print("Node hierarchy:")
	print_tree()
	if popup == null:
		print("PopupMenu node not found!")
	else:
		print("PopupMenu node found. Type: " + str(popup.get_class()))
		# Connect the "id_pressed" signal of the PopupMenu to a function
		popup.connect("id_pressed", Callable(self, "_on_Popup_id_pressed"))
		
		# Add "Sam Sucks" item to the PopupMenu
		popup.add_item("Fuck you Samuel! (don't click here)", 1)
		
		# Connect the button's pressed signal to show the popup
		self.connect("pressed", Callable(self, "_on_Button_pressed"))

func _on_Button_pressed():
	# Show the PopupMenu at the mouse position
	popup.position = get_global_mouse_position()
	popup.popup()

func _on_Popup_id_pressed(id):
	if id == 1:
		get_tree().change_scene_to_file("res://node_2d.tscn")
