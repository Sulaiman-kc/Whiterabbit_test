



import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whiterabbir/model/employees.dart';
import 'package:whiterabbir/service/api_service.dart';

class EmployeesListController extends GetxController{
  List<Employee>? employees;
  var language;
  var isEng = true;
  var search = '';

  List menu2 = [
    // {"SlNo":1,"label":"Your Orders", "icon":Icons.shopping_cart_outlined},
    {"SlNo":1,"title":"15 people visited Nazha Abhaya", "message": "Nazha Abhaya have a collection of latest designer abhayas. Check their profile to know more" ,"time": "5 minutes ago",},
    {"SlNo":2,"title":"Daily Quote", "message": "Start your day with Mobile? No, “ First have a Coffee “","time": "3h ago",},
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();


    changeLanguage();
  }


  changeLanguage() async {
    apiService().getApiService().then((value) {
      print('_employees');
      print(value.runtimeType);
      employees = value;
      update();
      // print(employees[0].name);
    });

    update();
  }


  toggleLang(){
    isEng = !isEng;
    changeLanguage();
    update();
  }
}