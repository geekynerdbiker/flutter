import 'package:flutter/material.dart';
import 'package:shallcook/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shallcook/page/common/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ShallCookApp();
  }
}

class ShallCookApp extends StatefulWidget {
  const ShallCookApp({Key? key}) : super(key: key);

  @override
  _MZoneAppState createState() => _MZoneAppState();
}

class _MZoneAppState extends State<ShallCookApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
