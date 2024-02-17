import 'package:flutter/material.dart';
import 'package:simpleauth/bloc/base/basestate.dart';
import 'package:simpleauth/bloc/base/basevent.dart';
import 'package:simpleauth/bloc/login/loginbloc.dart';
import 'package:simpleauth/presentation/dashboard.dart';
import 'package:simpleauth/presentation/registerpage.dart';

import '../utils/Constant.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc loginBloc = LoginBloc();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isloading = false;
  bool _validateUser = false;
  bool _validatePassword = false;

  void loginListener() {
    loginBloc.stream.listen((event) {
      if (event is Loading) {
        isloading = true;
      } else if (event is Loaded) {
        isloading = false;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Success"),
        ));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
      } else if (event is Error) {
        isloading = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(event.message),
        ));
        loginBloc.close();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg1.png"),
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
              "Welcome Back !",
              style: TextStyle(
                  color: Constant.purpleBold,
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  fontFamily: "Inter"),
            ),
            const Text(
              "Enter Your Username or Password",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Constant.purpleBold),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Username",
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
              "Password",
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
              height: 16,
            ),
            Center(
                child: isloading
                    ? const CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            _validateUser = usernameController.text.isEmpty;
                            _validatePassword = passwordController.text.isEmpty;
                            if (_validateUser || _validatePassword) {
                              return;
                            }
                            _validateUser = false;
                            _validatePassword = false;

                            loginBloc = LoginBloc();
                            loginBloc.add(PostLogin(usernameController.text,
                                passwordController.text));
                            loginListener();
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
                              "LOGIN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Inter",
                                  fontSize: 24),
                            ),
                          ),
                        ),
                      )),
            const SizedBox(
              height: 16,
            ),
            const Center(
              child: Text(
                "Forgoten password",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                  );
                },
                child: const Text("or Create New Account",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                        fontSize: 15)),
              ),
            ),
          ])),
    );
  }
}
