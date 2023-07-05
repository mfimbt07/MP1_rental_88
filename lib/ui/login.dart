import 'package:flutter/material.dart';
import 'package:rental_88/service/login_service.dart';
import 'package:rental_88/ui/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Icon icon = Icon(Icons.visibility);
  bool obscure = true;
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/bg_3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login Admin Rental 88",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Column(
                        children: [
                          _emailTextField(),
                          _passwordTextField(),
                          _tombolLogin()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Email"),
      controller: _emailCtrl,
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: "Enter Password",
        labelText: "Password",
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                if (obscure == true) {
                  obscure = false;
                  icon = Icon(Icons.visibility_off);
                } else {
                  obscure = true;
                  icon = Icon(Icons.visibility);
                }
              });
            },
            icon: icon),
      ),
      controller: _passwordCtrl,
    );
  }

  Widget _tombolLogin() {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            child: Text("Login"),
            onPressed: () async {
              String email = _emailCtrl.text;
              String password = _passwordCtrl.text;
              await LoginService().login(email, password).then((value) {
                if (value == true) {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                } else {
                  AlertDialog alertDialog = AlertDialog(
                    content: const Text("Email atau Password Tidak Valid"),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("OK"),
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                      )
                    ],
                  );
                  showDialog(
                      context: context, builder: (context) => alertDialog);
                }
              });
            }));
  }
}
