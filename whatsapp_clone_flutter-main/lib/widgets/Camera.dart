import 'dart:io' show File;
import 'dart:typed_data' show Uint8List;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:permission_handler/permission_handler.dart';

class PickImage extends StatefulWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  _PickImageState createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  dynamic
      _image; // Pode ser String (caminho do arquivo) ou Uint8List (dados da imagem)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _image != null
            ? _getImageWidget()
            : const Text('Nenhuma imagem selecionada'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _pickImage(ImageSource.gallery);
            },
            child: Icon(Icons.add_a_photo),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              _pickImage(ImageSource.camera);
            },
            child: Icon(Icons.camera_alt),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              _captureImage();
            },
            child: Icon(Icons.camera),
          ),
        ],
      ),
    );
  }

  Widget _getImageWidget() {
    if (_image is String) {
      // Caminho do arquivo (dispositivos móveis)
      return Image.file(File(_image));
    } else if (_image is Uint8List) {
      // Dados da imagem (Flutter Web)
      return Image.memory(_image);
    } else {
      return const Text('Tipo de imagem não suportado');
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();

    if (source == ImageSource.camera) {
      var status = await Permission.camera.request();
      if (status != PermissionStatus.granted) {
        return;
      }
    }

    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      _processImage(pickedFile);
    }
  }

  Future<void> _captureImage() async {
    var status = await Permission.camera.request();
    if (status == PermissionStatus.granted) {
      final imagePicker = ImagePicker();
      XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
      if (image != null) {
        _processImage(image);
      }
    }
  }

  void _processImage(XFile pickedFile) async {
    if (kIsWeb) {
      final imageBytes = await pickedFile.readAsBytes();
      final decodedImage = img.decodeImage(Uint8List.fromList(imageBytes));
      setState(() {
        _image = Uint8List.fromList(img.encodePng(decodedImage!));
      });
    } else {
      setState(() {
        _image = pickedFile.path;
      });
    }
  }
}
