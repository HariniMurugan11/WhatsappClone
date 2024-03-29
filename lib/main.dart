import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wp/Screen/CameraScreen.dart';
import 'Screen/Homescreen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Opensans",
        primaryColor:Color(0xFF075E54), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF128C7E),)
      
      ),
      home: Homescreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}