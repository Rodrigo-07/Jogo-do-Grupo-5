extends Node

var ipAdress: Array
var premio = str(Points.points)
var url = "https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=Parabens%20voce%20fez%20"+premio+"%20pontos%20"+Points.currentCode+"%20é%20seu%20código"

func _ready():

	$Atual.text = "Seu código atual é:"+Points.currentCode
	
	# Create an HTTP request node and connect its completion signal.
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.connect("request_completed", self, "_http_request_completed")

	# Perform the HTTP request. The URL below returns a PNG image as of writing.
	var error = http_request.request(url)
	if error != OK:
		push_error("An error occurred in the HTTP request.")


# Called when the HTTP request is completed.
func _http_request_completed(result, response_code, headers, body):
	var image = Image.new()
	var error = image.load_png_from_buffer(body)
	if error != OK:
		push_error("Couldn't load the image.")

	var texture = ImageTexture.new()
	texture.create_from_image(image)

	# Display the image in a TextureRect node.
	var texture_rect = TextureRect.new()
	add_child(texture_rect)
	texture_rect.texture = texture
	texture_rect.set_position(Vector2(100, 200))
	
#Colocar save code no jogo
func _on_SaveCodeButton_pressed():
	if Points.permission == 0:
		Points.currentCode = ($LineEdit.text)
		Points.currentCodeArray.clear()
		Points.permission = 1
		
		for i in range(Points.currentCode.length()):
			Points.currentCodeArray.append(int(Points.currentCode[i]))
			print(Points.currentCode[i])
			
		Points.addSaveCode()
		if Points.next == true:
			Points.currentSaveCode()
			get_tree().reload_current_scene()
		else:
			$Atual.text = "O código inserido é invalido"
		print("codigo:", Points.currentCode,"\narray:", Points.currentCodeArray, "\nlevel1: ", Points.stateLevel1, "\nlevel2: ", Points.stateLevel2, "\nlevel3: ", Points.stateLevel3, "\nPontos: ",Points.points)
	else:
		$Atual.set_position(Vector2(45, 500))
		$Atual.text = "Para inserir um novo código, por favor, feche o jogo e abra novamente"


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/menu/Menu.tscn")
