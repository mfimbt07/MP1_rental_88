import 'package:flutter/material.dart';
import '/helpers/user_info.dart';
import 'ui/home.dart';
import '/ui/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  print(token);
  runApp(MaterialApp(
    title: "Rental 88",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: token == null ? LoginPage() : Home(),
  ));
}
