extends KinematicBody2D

var last_checkpoint: Area2D = null

export (int) var run_speed = 390
export (int) var jump_speed = -430
export (int) var gravity = 700

var velocity = Vector2()
var jumping = false
onready var anim = $AnimationPlayer

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var jump = Input.is_action_just_pressed("ui_up")
	
	if jump and is_on_floor():
		anim.play("Jump")
		velocity.y = jump_speed	
	elif right:
		get_node( "Sprite" ).set_flip_h( false )
		anim.play("walk")
		velocity.x += run_speed
		if is_on_floor() == false:
			anim.play("Jump")
	elif left:
		get_node( "Sprite" ).set_flip_h( true )
		anim.play("walk")
		velocity.x -= run_speed
		if is_on_floor() == false:
			anim.play("Jump")
	else:
		anim.play("idle")
		if is_on_floor() == false:
			anim.play("Jump")
		
		
		
func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
	

