import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home.dart';
import 'sign.dart';
import 'reg.dart';
import 'chat.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    routes: {
      '/': (context) => home(),
      '/splash': (context) => splash(),
      '/reg': (context) => reg(),
      '/signin': (context) => sign(),
      '/chat': (context) => chat(),
    },
    initialRoute: '/splash',
  ));
}

class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      title: Text(
        'Welcome to ATOM',
        style: TextStyle(
          color: Colors.purple,
          fontSize: 40,
        ),
      ),
      navigateAfterSeconds: home(),
      seconds: 5,
      backgroundColor: Colors.black,
    );
  }
}
