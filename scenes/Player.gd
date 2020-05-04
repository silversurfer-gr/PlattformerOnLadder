extends KinematicBody2D


# Declarctions
const SPEED = 150
const FLOOR = Vector2(0, -1)
const GRAVITY = 10
const JUMP_POWER = 350

var velocity = Vector2()
var direction = 1 # right
var is_climping = false
var animation = false

onready var sprite = $AnimationPlayer


func _physics_process(delta):
	print(is_climping)
	velocity.x = 0
	#velocity.y = 0
	velocity.y += GRAVITY 
	
	check_key_input()
	
	velocity = move_and_slide(velocity, FLOOR)
	
	#if !animation:
	set_animation()


func check_key_input():
	if Input.is_action_pressed("ui_left"):
		velocity.x = - SPEED
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	if Input.is_action_pressed("ui_up") and is_climping:
		velocity.y = -SPEED
	if Input.is_action_pressed("ui_up"):
		velocity.y = -JUMP_POWER
	if Input.is_action_pressed("ui_down"):
		velocity.y = SPEED
	
		

func set_animation():
	#print("velocity: "+str(velocity)+" is_on_floor:"+str(is_on_floor()) )
	if velocity.x > 0:
		sprite.play("walk_right")
		direction = 1
	
	if velocity.x < 0:
		sprite.play("walk_left")
		direction = 0
	
	if velocity.x == 0:
		if direction:
			sprite.play("idle_right")
		else:
			sprite.play("idle_left")
		
	if !is_on_floor():
			if direction:
				sprite.play("air_right")
			else:
				sprite.play("air_left")
	
	if is_climping:
			sprite.play("climp")
		
	#animation = true


#func _on_AnimationPlayer_animation_finished(anim_name):
#	animation = false
