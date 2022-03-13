import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:whiterabbir/model/employees.dart';
import 'package:whiterabbir/pages/employee_details/employee_details_view.dart';
import 'employees_list_controller.dart';



class EmployeesListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:
        Container(
            child: Text("Employees", style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * .041, fontWeight: FontWeight.w700),),
          ),


          centerTitle: true,
          backgroundColor: Color(0xFFAA0038),
          elevation: 1,
        ),
        body:  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(height: 0, color: Color(0xFFE8E4E4),),
              SizedBox(height: MediaQuery.of(context).size.width * 0.0487,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.0615),
                width: MediaQuery.of(context).size.width,
                child: Material(
                  elevation: 0,
                  color: Color(0xFFF2F1F1),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child:
                  GetBuilder<EmployeesListController>(
                      init: EmployeesListController(), // intialize with the Controller
                      builder: (value){
                        return Container(
                          // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .0615),
                          child: TextField(
                            onChanged: (String val){
                              value.search = val;
                              value.update();
                            },
                            onTap: (){
                            },
                            cursorColor: Colors.deepOrange,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search_rounded, color: Color(0xFFA29C9C),),
                                fillColor: Color(0xFFFCF9F9),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                    borderSide: BorderSide(color: Color(0xFFCBC3C4))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                    borderSide: BorderSide(color: Color(0xFFCBC3C4))),
                                hintText: 'Search',
                                hintStyle: TextStyle(color: Color(0xFFC3BFBF), fontSize: MediaQuery.of(context).size.width * .0359),
                                filled: true,
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .0615, vertical: MediaQuery.of(context).size.width * .047)),
                          ),
                        );
                      }
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.0436,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .0615),
                child: GetBuilder<EmployeesListController>(
                    init: EmployeesListController(),
                    builder: (value){
                      return (value.employees == null || value.employees!.length == 0)? Center(child: CircularProgressIndicator(),) :
                      ListView.builder(
                        physics: ScrollPhysics(),
                        itemCount: value.employees!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index){
                          return EmployeeCard(context, index, value.employees, value.search);
                        },
                      );
                    }
                ),
              )
            ],
          ),
        )
    );
  }


  Widget EmployeeCard(context, index, employee, searchParams){
    return Column(
      children: [
        if(employee![index].name.toString().toLowerCase().contains(searchParams.toString().toLowerCase()) ||
            employee![index].email.toString().toLowerCase().contains(searchParams.toString().toLowerCase())
        )
          InkWell(
            onTap: (){
              Get.to(EmployeeDetailsPage(employee[index]));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Color(0xFFF7F5F5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * .0308),
                    child: (employee![index].profileImage != "null")?ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        employee![index].profileImage,
                        width: MediaQuery.of(context).size.width * .241,
                        height: MediaQuery.of(context).size.width * .2462,
                        fit: BoxFit.cover,
                      ),
                    ):Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      width: MediaQuery.of(context).size.width * .241,
                      height: MediaQuery.of(context).size.width * .2462,
                      child: Center(
                        child: Text('No Image'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .0152),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.width * 0.0462,),
                        Text(employee![index].name, style: TextStyle(color: Color(0xFF1C1B1B), fontSize: MediaQuery.of(context).size.width * .0359, fontWeight: FontWeight.bold),),
                        SizedBox(height: MediaQuery.of(context).size.width * 0.0231,),
                        Text(employee![index].company.name, style: TextStyle(color: Color(0xFFA29C9C), fontSize: MediaQuery.of(context).size.width * .0308),),
                        SizedBox(height: MediaQuery.of(context).size.width * 0.0351,),
                        Text(employee![index].email, style: TextStyle(color: Color(0xFF8B8686), fontSize: MediaQuery.of(context).size.width * .0308),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        SizedBox(height: MediaQuery.of(context).size.width * 0.0308,),
      ],
    );
  }
}
