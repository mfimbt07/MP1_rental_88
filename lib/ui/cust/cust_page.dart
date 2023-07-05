import 'package:flutter/material.dart';
import 'package:rental_88/model/cust.dart';
import 'package:rental_88/service/cust_service.dart';
import 'cust_form.dart';
import 'cust_item.dart';
import '../widget/sidebar.dart';

class CustPage extends StatefulWidget {
  const CustPage({Key? key}) : super(key: key);
  _CustPageState createState() => _CustPageState();
}

class _CustPageState extends State<CustPage> {
  Stream<List<Cust>> getList() async* {
    List<Cust> data = await CustService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Customer"),
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
              return CustItem(cust: snapshot.data[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CustForm()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
