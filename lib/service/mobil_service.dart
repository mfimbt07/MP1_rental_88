import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/mobil.dart';

class MobilService {
  Future<List<Mobil>> listData() async {
    final Response response = await ApiClient().get('mobil');
    print(response);
    final List data = response.data as List;
    List<Mobil> result = data.map((json) => Mobil.fromJson(json)).toList();
    return result;
  }

  Future<Mobil> simpan(Mobil mobil) async {
    var data = mobil.toJson();
    final Response response = await ApiClient().post('mobil', data);
    Mobil result = Mobil.fromJson(response.data);
    return result;
  }

  Future<Mobil> ubah(Mobil mobil, String id) async {
    var data = mobil.toJson();
    final Response response = await ApiClient().put('mobil/${id}', data);
    print(response);
    Mobil result = Mobil.fromJson(response.data);
    return result;
  }

  Future<Mobil> getById(String id) async {
    final Response response = await ApiClient().get('mobil/${id}');
    Mobil result = Mobil.fromJson(response.data);
    return result;
  }

  Future<Mobil> hapus(Mobil mobil) async {
    final Response response = await ApiClient().delete('mobil/${mobil.id}');
    Mobil result = Mobil.fromJson(response.data);
    return result;
  }
}
