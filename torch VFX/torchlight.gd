extends OmniLight3D

@export var noise:Noise
@onready var ref_pos: Vector3 = position
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $"../AudioStreamPlayer3D"

var t:float
@export var radius:float = .55

func _physics_process(delta: float) -> void:
	t += delta
	position = ref_pos + radius * Vector3(noise.get_noise_3d(t,0,0),noise.get_noise_3d(0,t,0),noise.get_noise_3d(0,0,t))
	if t > 100: t = t - 100

func _ready() -> void:
	audio_stream_player_3d.seek(randf_range(0., audio_stream_player_3d.stream.get_length()))
