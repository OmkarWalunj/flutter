
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate loading time (replace with your actual loading logic)
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, 'myapp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Replace with your desired background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Logo.png', // Replace with your logo image path
              width: 200, // Adjust as needed
            ),
            // Add any additional elements (taglines, loading indicators) if desired
          ],
        ),
      ),
    );
  }
}
