import 'package:flutter/material.dart';
import 'package:rental_88/helpers/user_info.dart';
import 'package:rental_88/ui/home.dart';
import 'package:rental_88/ui/login.dart';
import 'package:rental_88/ui/cust/cust_page.dart';
import 'package:rental_88/ui/mobil/mobil_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
              accountName: Text("Admin 1 Rental 88"),
              accountEmail: Text("admin.01@gmail.com")),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          ListTile(
            leading: Icon(Icons.car_rental_rounded),
            title: Text("Data Mobil"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MobilPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Data Customer"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CustPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              UserInfo().logout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
