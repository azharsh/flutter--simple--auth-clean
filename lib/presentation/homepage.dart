import 'package:flutter/material.dart';
import 'package:simpleauth/presentation/loginpage.dart';
import 'package:simpleauth/utils/Constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 100,
                ),
                Image.asset(
                  "assets/circle.png",
                  width: 80,
                  height: 160,
                )
              ],
            ),
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
              "Let's Get Started",
              style: TextStyle(
                  color: Constant.purpleBold,
                  fontFamily: "Inter",
                  fontSize: 75,
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
            Center(
                child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(14),
                width: 178,
                height: 62,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/purplebutton.png"),
                      fit: BoxFit.contain),
                ),
                child: const Center(
                  child: Text(
                    "JOIN NOW",
                    style: TextStyle(
                        color: Colors.white, fontFamily: "Inter", fontSize: 24),
                  ),
                ),
              ),
            ))
          ])),
    );
  }
}
