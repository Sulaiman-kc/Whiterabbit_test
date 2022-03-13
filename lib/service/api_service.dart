import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:whiterabbir/model/employees.dart';
var URL = 'http://www.mocky.io/v2/5d565297300000680030a986';


class apiService{
  Future<List<Employee>> getApiService() async {
    var client = http.Client();
    Employee _employee;
    Map<String,String> headers = {'Content-Type':'application/json'};
    try {
      print((URL));
      var uriResponse = await client.get( Uri.parse(URL));
      var jsonString = uriResponse.body;
      return employeeFromJson(jsonString);
    }
    finally {
      client.close();
    }
  }
}
