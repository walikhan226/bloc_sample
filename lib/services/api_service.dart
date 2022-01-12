import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/data_model.dart';

class DoctorRepository {
  Future<DoctorsModel> getDoctors() async {
    print("doctors 1");

    http.Response response = await http.get(Uri.http(
        "checkmb.us.tempcloudsite.com", "/musb/public/api/total_doctors"));

    print("doctors 2 ");
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(" --- response --- ");
      print(response.body);

      var data = json.decode(response.body);

      DoctorsModel doctorsModel = DoctorsModel.fromJson(data);

      return doctorsModel;
    } else {
      throw Exception();
    }
  }
}
