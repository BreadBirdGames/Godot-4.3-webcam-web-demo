extends Node

var js_update_camera = JavaScriptBridge.create_callback(update_camera) # This reference must be kept
var externalator = JavaScriptBridge.get_interface("externalator")
var video = externalator.video

const png_prefix = "data:image/png;base64,"
const jpeg_prefix = "data:image/jpeg;base64,"

var cameraPreview = null

func update_camera(data):
	if cameraPreview != null:
		var img: Image = Image.new()

		print(data[0])
		print(png_prefix)

		var p = data[0].right(-png_prefix.length())

		print(p)
		img.load_png_from_buffer(Marshalls.base64_to_raw(p))

		cameraPreview.texture = ImageTexture.create_from_image(img)

func _ready() -> void:
	externalator.addGodotFunction('update_camera', js_update_camera)
	cameraPreview = get_tree().get_nodes_in_group("CameraPreview")[0]
