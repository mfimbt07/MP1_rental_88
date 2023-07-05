import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/cust.dart';

class CustService {
  Future<List<Cust>> listData() async {
    final Response response = await ApiClient().get('cust');
    print(response);
    final List data = response.data as List;
    List<Cust> result = data.map((json) => Cust.fromJson(json)).toList();
    return result;
  }

  Future<Cust> simpan(Cust cust) async {
    var data = cust.toJson();
    final Response response = await ApiClient().post('cust', data);
    Cust result = Cust.fromJson(response.data);
    return result;
  }

  Future<Cust> ubah(Cust cust, String id) async {
    var data = cust.toJson();
    final Response response = await ApiClient().put('cust/${id}', data);
    print(response);
    Cust result = Cust.fromJson(response.data);
    return result;
  }

  Future<Cust> getById(String id) async {
    final Response response = await ApiClient().get('cust/${id}');
    Cust result = Cust.fromJson(response.data);
    return result;
  }

  Future<Cust> hapus(Cust cust) async {
    final Response response = await ApiClient().delete('cust/${cust.id}');
    Cust result = Cust.fromJson(response.data);
    return result;
  }
}
