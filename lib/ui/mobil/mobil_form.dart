import 'package:flutter/material.dart';
import 'package:rental_88/model/mobil.dart';
import 'package:rental_88/service/mobil_service.dart';
import 'package:rental_88/ui/mobil/mobil_page.dart';

class MobilForm extends StatefulWidget {
  const MobilForm({super.key});

  @override
  State<MobilForm> createState() => _MobilFormState();
}

class _MobilFormState extends State<MobilForm> {
  final _keyForm = GlobalKey<FormState>();
  final _merkTextboxCtr = TextEditingController();
  final _namaTextboxCtr = TextEditingController();
  final _tahunTextboxCtr = TextEditingController();
  final _warnaTextboxCtr = TextEditingController();
  final _transmisiTextboxCtr = TextEditingController();
  final _kapasitasTextboxCtr = TextEditingController();
  final _stokTextboxCtr = TextEditingController();
  final _hargasewaTextboxCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Form Tambah Mobil"),
        ),
        body: Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            child: SingleChildScrollView(
              child: Form(
                key: _keyForm,
                child: Column(
                  children: [
                    _merkTextfield(),
                    _namaTextfield(),
                    _tahunTextfield(),
                    _warnaTextfield(),
                    _transmisiTextfield(),
                    _kapasitasTextfield(),
                    _stokTextfield(),
                    _hargasewaTextfield(),
                    const SizedBox(
                      height: 20,
                    ),
                    _tombolSimpan()
                  ],
                ),
              ),
            )));
  }

  _merkTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "Merk"),
      controller: _merkTextboxCtr,
    );
  }

  _namaTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "Nama"),
      controller: _namaTextboxCtr,
    );
  }

  _tahunTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "Tahun Rilis"),
      controller: _tahunTextboxCtr,
    );
  }

  _warnaTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "Warna"),
      controller: _warnaTextboxCtr,
    );
  }

  _transmisiTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "Transmisi"),
      controller: _transmisiTextboxCtr,
    );
  }

  _kapasitasTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "Kapasitas"),
      controller: _kapasitasTextboxCtr,
    );
  }

  _stokTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "Stok"),
      controller: _stokTextboxCtr,
    );
  }

  _hargasewaTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "Harga Sewa/Hari"),
      controller: _hargasewaTextboxCtr,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Mobil mobil = new Mobil(
              merk: _merkTextboxCtr.text,
              nama: _namaTextboxCtr.text,
              tahun: _tahunTextboxCtr.text,
              warna: _warnaTextboxCtr.text,
              transmisi: _transmisiTextboxCtr.text,
              kapasitas: _kapasitasTextboxCtr.text,
              stok: _stokTextboxCtr.text,
              hargasewa: _hargasewaTextboxCtr.text);
          await MobilService().simpan(mobil).then((value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MobilPage()));
          });
        },
        child: const Text("Tambah"));
  }
}
