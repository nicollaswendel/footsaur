extends CharacterBody2D

@export var speed = 300.0
@export var jump_velocity = -400.0

@export var player2 = false

var dir
var gravity = 980

@onready var animator = $Alek

func _ready():
	
	if player2:
		animator = $Doug
		animator.flip_h = true
		$CollisionShape2D.position.x = -2
		$Doug.show()
		$Alek.hide()
	pass

func _physics_process(delta):
	
	Move(delta)
	Animations()
	
	pass

func Move(delta):
	
	if player2 == false:
		dir = Input.get_axis("Left", "Right")
	else:
		dir = Input.get_axis("Left 2", "Right 2")
	
	if dir:
		velocity.x = dir * speed
	elif dir == 0:
		velocity.x = 0
	
	if !is_on_floor():
		velocity.y += gravity * delta
	
	if player2 == false:
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = jump_velocity
		
	if player2 == true:
		if Input.is_action_just_pressed("Jump 2") and is_on_floor():
			velocity.y = jump_velocity
			
	move_and_slide()
	
	pass


func Animations():
	
	if velocity.x != 0 and is_on_floor():
		animator.play("Run")
		
	elif velocity.x == 0 and is_on_floor():
		animator.play("Idle")
		
	if !is_on_floor():
		animator.play("Jump")
	
	pass
