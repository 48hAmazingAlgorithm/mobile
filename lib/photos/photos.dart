import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FutureBuilder(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.done
                ? CameraPreview(_controller)
                : Center(
                    child: Text('loading'),
                  );
          }),
    ));
  }
}
