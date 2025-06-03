# Godot 4.3 webcam web demo

This is a small demo of webcam support in HTML exports for godot 4.3.
To build you will have to use the index.html in the Template directory as a custom shell, it contains the code to actually copy the frame data to your game.
JSHandler.gd then interprets that data into your img.
