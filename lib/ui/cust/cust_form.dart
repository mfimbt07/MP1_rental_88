import 'package:flutter/material.dart';
import 'package:rental_88/model/cust.dart';
import 'package:rental_88/service/cust_service.dart';
import 'package:rental_88/ui/cust/cust_page.dart';

class CustForm extends StatefulWidget {
  const CustForm({super.key});

  @override
  State<CustForm> createState() => _CustFormState();
}

class _CustFormState extends State<CustForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaCust = TextEditingController();
  final _jenisKel = TextEditingController();
  final _alamatCust = TextEditingController();
  final _noTelpCust = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Tambah Customer"),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _fieldNamaCust(),
                _fieldJenisKelCust(),
                _fieldAlamatCust(),
                _fieldNoTelpCust(),
                const SizedBox(
                  height: 20,
                ),
                _tombolSimpan()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _fieldNamaCust() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Customer"),
      controller: _namaCust,
    );
  }

  _fieldJenisKelCust() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jenis Kelamin"),
      controller: _jenisKel,
    );
  }

  _fieldAlamatCust() {
    return TextField(
      decoration: const InputDecoration(labelText: "Alamat"),
      controller: _alamatCust,
    );
  }

  _fieldNoTelpCust() {
    return TextField(
      decoration: const InputDecoration(labelText: "No Telpon"),
      controller: _noTelpCust,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Cust cust = new Cust(
              namaCust: _namaCust.text,
              jenisKelCust: _jenisKel.text,
              alamatCust: _alamatCust.text,
              noTelpCust: _noTelpCust.text);
          await CustService().simpan(cust).then((value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => CustPage()));
          });
        },
        child: const Text("Tambah"));
  }
}
