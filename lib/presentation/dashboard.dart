import 'package:flutter/material.dart';

import '../utils/Constant.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg3.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(children: [

            Center(
              child: Image.asset(
                "assets/head.png",
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Welcome to Home",
              style: TextStyle(
                  color: Constant.purpleBold,
                  fontFamily: "Inter",
                  fontSize: 50,
                  wordSpacing: 0.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5),
            ),
            const Text(
              "Grow Together",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 20,
                  color: Constant.purpleBold),
            ),
            const SizedBox(
              height: 12,
            ),
          ])),
    );
  }
}
