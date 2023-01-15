import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'screens/homepage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3200)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const _SplashScreen();
  }
}

/************************/
//    Splash Screen    //
/************************/

class _SplashScreen extends StatelessWidget {
  const _SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 39, 142),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            SizedBox(
              height: 360,
              child: Lottie.network('https://assets10.lottiefiles.com/packages/lf20_hylaaytn.json'),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Developed by AmiL',
                  textStyle: GoogleFonts.pressStart2p(fontSize: 20, color: Colors.white),
                  speed: const Duration(milliseconds: 120),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
