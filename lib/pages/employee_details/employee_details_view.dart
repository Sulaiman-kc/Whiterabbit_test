/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
 */

import 'package:flutter/material.dart';
import 'package:whiterabbir/model/employees.dart';

class EmployeeDetailsPage extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile1.dart";

  EmployeeDetailsPage(this.employee);
  Employee employee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepOrange,
      appBar: AppBar(title:
        Container(
          child: Text("View Details", style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * .041, fontWeight: FontWeight.w700),),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFAA0038),
        elevation: 1,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.5, 0.9],
                    colors: [Color(0xFFAA0038), Color(0xFF992D53)])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      minRadius: 60,
                      backgroundColor: Colors.deepOrange.shade300,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(employee.profileImage),
                        minRadius: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  employee.name,
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),
                Text(
                  employee.address.city,
                  style: TextStyle(fontSize: 14.0, color: Colors.white70),
                )
              ],
            ),
          ),
          ListTile(
            title: Text(
              "User Name",
              style: TextStyle(color: Color(0xFFAA0038), fontSize: 12.0),
            ),
            subtitle: Text(
              employee.username,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Email Address",
              style: TextStyle(color: Color(0xFFAA0038), fontSize: 12.0),
            ),
            subtitle: Text(
              employee.email,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Address",
              style: TextStyle(color: Color(0xFFAA0038), fontSize: 12.0),
            ),
            subtitle: Text(
              "${employee.address.suite}, ${employee.address.street}, ${employee.address.city}",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Phone",
              style: TextStyle(color: Color(0xFFAA0038), fontSize: 12.0),
            ),
            subtitle: Text(
              employee.phone,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Website",
              style: TextStyle(color: Color(0xFFAA0038), fontSize: 12.0),
            ),
            subtitle: Text(
              employee.website,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Company Details",
              style: TextStyle(color: Color(0xFFAA0038), fontSize: 12.0),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employee.company.name,
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  employee.company.catchPhrase,
                  style: TextStyle(fontSize: 10.0),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}