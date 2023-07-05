import 'package:flutter/material.dart';
import 'package:rental_88/ui/widget/sidebar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Sidebar(),
        appBar: AppBar(title: Text("Dashboard")),
        body: Center(
          child: Text("Selamat Bekerja Admin 1 Rental 88",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black87,
              )),
        ));
  }
}
