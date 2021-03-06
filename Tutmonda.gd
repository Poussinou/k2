extends Node

var Radiko = null
var Niveloj = null
var nivelo = 0
var pako = 1
var jxus_rekordita = false
var Kaptitajxo = null

var agordejo = "user://agordejo.cfg"
onready var Agordejo = ConfigFile.new()

var lingvo_elektita = false

var akcelometro_aktivita = true
var os = OS.get_name()

var Objekto = null
var foranta = false
var steloj = 0

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		if get_tree().get_current_scene().get_name() == "Niveloj":
			get_tree().quit()
		elif get_tree().get_current_scene().get_name() == "Lingvo" and not T.lingvo_elektita:
			pass
			print(1)
		else:
			get_tree().change_scene("res://Niveloj.tscn")

func _ready():
	Agordejo.load(agordejo)
	if os == "Android":
		akcelometro_aktivita = Agordejo.get_value("Agordoj", "akcelometro", true)
	else:
		akcelometro_aktivita = Agordejo.get_value("Agordoj", "akcelometro", false)

func plenigi_cxielon_de_steloj():
	var Stelo = preload("res://Elementoj/Stelo.tscn")
	for i in range(100):
			randomize()
			var Stelo_ = Stelo.instance()
			Stelo_.set_global_pos(Vector2(rand_range(-1300,3500), rand_range(-500, 400)))
			add_child(Stelo_)
