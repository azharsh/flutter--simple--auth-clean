import 'package:flutter/material.dart';
import 'package:simpleauth/bloc/base/basevent.dart';
import 'package:simpleauth/bloc/register/registerbloc.dart';

import '../bloc/base/basestate.dart';
import '../utils/Constant.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc registerBloc = RegisterBloc();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  bool isloading = false;
  bool _validateEmail = false;
  bool _validateUser = false;
  bool _validatePassword = false;

  void registerListener() {
    registerBloc.stream.listen((event) {
      if (event is Loading) {
        isloading = true;
      } else if (event is Loaded) {
        isloading = false;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Success"),
        ));
        Navigator.pop(context);
      } else if (event is Error) {
        isloading = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(event.message),
        ));
        registerBloc.close();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg2.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/backarrow.png",
                    width: 48,
                    height: 48,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Create Account :)",
              style: TextStyle(
                  color: Constant.purpleBold,
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  fontFamily: "Inter"),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Enter Email id",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                errorText: _validateEmail ? "Value Can't Be Empty" : null,
              ),
              style: const TextStyle(
                  fontFamily: "Inter",
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
            const Text(
              "Create Username",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                errorText: _validateUser ? "Value Can't Be Empty" : null,
              ),
              style: const TextStyle(
                  fontFamily: "Inter",
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Create Password",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                errorText: _validatePassword ? "Value Can't Be Empty" : null,
              ),
              style: const TextStyle(
                  fontFamily: "Inter",
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 24,
            ),
            Center(
                child: isloading
                    ? const CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            _validateEmail = emailController.text.isEmpty;
                            _validateUser = usernameController.text.isEmpty;
                            _validatePassword = passwordController.text.isEmpty;
                            if (_validateUser ||
                                _validatePassword ||
                                _validateEmail) {
                              return;
                            }
                            _validateEmail = false;
                            _validateUser = false;
                            _validatePassword = false;

                            registerBloc = RegisterBloc();
                            registerBloc.add(PostRegister(
                                emailController.text,
                                usernameController.text,
                                passwordController.text));
                            registerListener();
                          });
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
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Inter",
                                  fontSize: 24),
                            ),
                          ),
                        ),
                      )),
          ])),
    );
  }
}
