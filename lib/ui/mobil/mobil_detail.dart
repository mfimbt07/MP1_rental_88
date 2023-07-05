import 'package:flutter/material.dart';
import 'package:rental_88/model/mobil.dart';
import 'package:rental_88/service/mobil_service.dart';
import 'package:rental_88/ui/mobil/mobil_update.dart';
import 'mobil_page.dart';

class MobilDetail extends StatefulWidget {
  final Mobil mobil;

  const MobilDetail({Key? key, required this.mobil}) : super(key: key);
  _MobilDetailState createState() => _MobilDetailState();
}

class _MobilDetailState extends State<MobilDetail> {
  Stream<Mobil> getData() async* {
    Mobil data = await MobilService().getById(widget.mobil.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Mobil")),
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
                "Merk Mobil : ${snapshot.data.merk}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "Nama Mobil : ${snapshot.data.nama}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "Tahun Rilis : ${snapshot.data.tahun}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "Warna : ${snapshot.data.warna}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "Transmisi : ${snapshot.data.transmisi}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "Kapasitas : ${snapshot.data.kapasitas}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "Stok : ${snapshot.data.stok}",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "Harga Sewa/Hari : ${snapshot.data.hargasewa}",
                style: TextStyle(fontSize: 20),
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
                          MobilUpdateForm(mobil: snapshot.data)));
            },
            style: ElevatedButton.styleFrom(primary: Colors.green),
            child: const Text("Ubah")));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin ingin menghapus Data Mobil ini?"),
            actions: [
              StreamBuilder(
                  stream: getData(),
                  builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                        onPressed: () async {
                          await MobilService()
                              .hapus(snapshot.data)
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MobilPage()));
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
