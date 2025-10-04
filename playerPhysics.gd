extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_force: float = 400.0
@export var gravity: float = 900.0

func _physics_process(delta):
	# Add gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Movement (left/right)
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = -jump_force

	# Move the body
	move_and_slide()
