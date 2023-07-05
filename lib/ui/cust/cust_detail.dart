import 'package:flutter/material.dart';
import 'package:rental_88/model/cust.dart';
import 'package:rental_88/service/cust_service.dart';
import 'package:rental_88/ui/cust/cust_update.dart';
import 'cust_page.dart';

class CustDetail extends StatefulWidget {
  final Cust cust;

  const CustDetail({Key? key, required this.cust}) : super(key: key);
  _CustDetailState createState() => _CustDetailState();
}

class _CustDetailState extends State<CustDetail> {
  Stream<Cust> getData() async* {
    Cust data = await CustService().getById(widget.cust.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Customer")),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('Data Tidak Ditemukan');
          }
          return Column(
            children: [
              const SizedBox(height: 20),
              Text(
                "Nama : ${snapshot.data.namaCust}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "Jenis Kelamin : ${snapshot.data.jenisKelCust}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "Alamat : ${snapshot.data.alamatCust}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "No. Telp : ${snapshot.data.noTelpCust}",
                style: const TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_tombolUbah(), _tombolHapus()],
              )
            ],
          );
        },
      ),
    );
  }

  _tombolUbah() {
    return StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CustUpdateForm(cust: snapshot.data)));
            },
            style: ElevatedButton.styleFrom(primary: Colors.green),
            child: const Text("Ubah")));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin ingin menghapus Data Customer ini?"),
            actions: [
              StreamBuilder(
                  stream: getData(),
                  builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                        onPressed: () async {
                          await CustService()
                              .hapus(snapshot.data)
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CustPage()));
                          });
                        },
                        child: const Text("YA"),
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                      )),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Tidak"),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              )
            ],
          );
          showDialog(context: context, builder: (context) => alertDialog);
        },
        style: ElevatedButton.styleFrom(primary: Colors.red),
        child: const Text("Hapus"));
  }
}
