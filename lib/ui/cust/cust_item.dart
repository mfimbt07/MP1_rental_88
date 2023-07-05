import 'package:flutter/material.dart';
import 'package:rental_88/model/cust.dart';
import 'cust_detail.dart';

class CustItem extends StatelessWidget {
  final Cust cust;

  const CustItem({super.key, required this.cust});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${cust.namaCust}"),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CustDetail(cust: cust)));
      },
    );
  }
}
