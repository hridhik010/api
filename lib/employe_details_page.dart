import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'datamodel.dart';
import 'main.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailsScreen({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Employee Details')),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(employee.profileImage),
                ),
                SizedBox(height: 20),
                Text('Name: ${employee.name}'),
                SizedBox(height: 10),
                Text('Company: ${employee.companyName}'),
                SizedBox(height: 10),
              ]
            ),
    )
    );
    }
}