import 'package:flutter/material.dart';
import 'package:rental_88/model/mobil.dart';
import 'package:rental_88/service/mobil_service.dart';
import 'mobil_form.dart';
import 'mobil_item.dart';
import '../widget/sidebar.dart';

class MobilPage extends StatefulWidget {
  const MobilPage({Key? key}) : super(key: key);
  _MobilPageState createState() => _MobilPageState();
}

class _MobilPageState extends State<MobilPage> {
  Stream<List<Mobil>> getList() async* {
    List<Mobil> data = await MobilService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Mobil"),
      ),
      body: StreamBuilder(
        stream: getList(),
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
            return Text('Data Kosong');
          }

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return MobilItem(mobil: snapshot.data[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MobilForm()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
