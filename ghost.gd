extends KinematicBody2D

const MOTION_SPEED = 160 # Pixels/second.
enum States { STOPPED, MOVING }
var _state = States.STOPPED
var _destination = Vector2()

func _physics_process(_delta):
	if _state == States.MOVING:
		if position.distance_to(_destination) < 2:
			_state = States.STOPPED
		else:
			var motion = Vector2(_destination.x - position.x, _destination.y - position.y)
			move_and_slide(motion.normalized() * MOTION_SPEED)

func _unhandled_input(event):
	if event.is_action_pressed("click"):
		_destination = get_global_mouse_position()		
		_state = States.MOVING
