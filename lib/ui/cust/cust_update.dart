import 'package:flutter/material.dart';
import 'package:rental_88/model/cust.dart';
import 'package:rental_88/service/cust_service.dart';
import 'package:rental_88/ui/cust/cust_page.dart';

class CustUpdateForm extends StatefulWidget {
  final Cust cust;

  const CustUpdateForm({Key? key, required this.cust}) : super(key: key);
  _CustUpdateFormState createState() => _CustUpdateFormState();
}

class _CustUpdateFormState extends State<CustUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaCust = TextEditingController();
  final _jenisKel = TextEditingController();
  final _alamatCust = TextEditingController();
  final _noTelpCust = TextEditingController();

  Future<Cust> getData() async {
    Cust data = await CustService().getById(widget.cust.id.toString());
    setState(() {
      _namaCust.text = widget.cust.namaCust;
      _jenisKel.text = widget.cust.jenisKelCust;
      _alamatCust.text = widget.cust.alamatCust;
      _noTelpCust.text = widget.cust.noTelpCust;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Data Customer")),
      body: SingleChildScrollView(
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

          String id = widget.cust.id.toString();
          await CustService().ubah(cust, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => CustPage()));
          });
        },
        child: const Text("Simpan Data Customer"));
  }
}
