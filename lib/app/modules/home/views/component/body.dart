import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transisi_app/app/data/model_user.dart';
import 'package:http/http.dart' as http;
import 'package:transisi_app/app/modules/home/views/component/createData.dart';
import '../../../../data/model_login.dart';
class Body extends StatelessWidget {
  
  Future<List<Datum>?> getUser() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      List allData =
          (json.decode(response.body) as Map<String, dynamic>)['data'];
      List<Datum> data = [];
      allData.forEach((element) {
        data.add(Datum(
            avatar: element['avatar'],
            firstName: element['first_name'],
            lastName: element['last_name'],
            email: element['email'],
            id: element['id'].toString()));
      });
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Datum>?>(
            future: getUser(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data![index].avatar),
                        ),
                        title: Text("${snapshot.data![index].firstName} ${snapshot.data![index].lastName}"),
                        subtitle: Text(snapshot.data![index].email),
                      ),
                      color: Color(0xffDEF3F4),
                      elevation: 8,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Color(0xffDEF3F4))),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
      bottomNavigationBar: 
      FloatingActionButton(
        onPressed: () {
          Get.to(CreateData());
        }, 
        child: Icon(Icons.add),)
     
    );
  }
}
