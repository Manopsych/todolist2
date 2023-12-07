import 'package:flutter/material.dart';
import 'package:sixthapp/screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SpashState();
}

class _SpashState extends State<Splash> {
  initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 215, 59, 59),
        child: Center(
          child: Image.asset('images/todoist.jpg'),
        ),
        ),
      );
    
  }
}
   