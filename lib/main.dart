import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mobile/clients/clients_page.dart';
import 'package:mobile/login/login_page.dart';
import 'package:mobile/photos/photos.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final List<CameraDescription> cameras = await availableCameras();

  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MyApp({super.key, required this.cameras});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Clients(),
        '/login': (context) => Login(),
        '/photos': (context) => TakePicture(cameras: cameras,)
      },
    );
  }
}
