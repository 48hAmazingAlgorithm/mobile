import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TakePicture extends StatefulWidget {
  final List<CameraDescription> cameras;

  TakePicture({super.key, required this.cameras});

  @override
  _TakePictureState createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  late Future<void> _initializeControllerFuture;
  late CameraController _controller;

  Future<void> initCamera(CameraDescription camera) async {
    _controller = CameraController(camera, ResolutionPreset.medium);

    _controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    if (_controller.value.hasError) {
      print('Camera Error');
    }

    _initializeControllerFuture = _controller.initialize();

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _cameraToggle() async {
    await initCamera(widget.cameras.first);
  }

  @override
  void initState() {
    super.initState();
    _cameraToggle();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _sendImageToBackend(String imagePath) async {
    final uri = Uri.parse('http://localhost:8080/postPhoto');
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('photo', imagePath));

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        print('Image envoyée avec succès');
      } else {
        print('Échec de l\'envoi de l\'image: ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors de l\'envoi de l\'image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                children: [
                  CameraPreview(_controller),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FloatingActionButton(
                        onPressed: () async {
                          try {
                            await _initializeControllerFuture;
                            final image = await _controller.takePicture();
                            if (!mounted) return;
                            await _sendImageToBackend(image.path);
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DisplayPictureScreen(imagePath: image.path),
                              ),
                            );
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: Icon(Icons.camera_alt),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photo prise')),
      body: Center(child: Image.file(File(imagePath))),
    );
  }
}
