import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'datamodel.dart';
import 'employe_details_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Employee> employeeList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://www.mocky.io/v2/5d565297300000680030a986'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      setState(() {
        employeeList = data
            .map((item) => Employee(
          name: item['name'],
          profileImage: item['profile_image'] ?? '',
          companyName: item['company'] != null ? item['company']['name'] : '',

        ))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee List')),
      body: ListView.builder(
        itemCount: employeeList.length,
        itemBuilder: (context, index) {
          final employee = employeeList[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(employee.profileImage),
            ),
            title: Text(employee.name),
            subtitle: Text(employee.companyName),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeDetailsScreen(employee: employee,)));
            },
          );
        },
      ),
    );
  }
}

 