extends OmniLight3D

@export var noise:Noise
@export var radius:float = .55

@onready var original_position: Vector3 = position
var offset: Vector3
var time: float

@export var audio_stream_player_3d: AudioStreamPlayer3D

func _physics_process(delta: float) -> void:
	time += delta
	
	offset.x = noise.get_noise_3d(time,0,0)
	offset.y = noise.get_noise_3d(0,time,0)
	offset.z = noise.get_noise_3d(0,0,time)
	
	position = original_position + radius * offset

func _ready() -> void:
	audio_stream_player_3d.seek(randf_range(0., audio_stream_player_3d.stream.get_length()))
